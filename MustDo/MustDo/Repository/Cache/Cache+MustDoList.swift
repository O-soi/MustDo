//
//  Cache+MustDoList.swift
//  MustDo
//
//  Created by 남기범 on 2023/01/19.
//

import Foundation
import CoreData
import Usecase
import OSLog

extension Cache {
    func loadTodayMustDoList() -> [MustDo] {
        return fetchMustDoEntities(date: Date())
    }
    
    func fetchMustDoEntities(date: Date) -> [MustDo] {
        return self.fetch(MustDoTable.fetchRequest())
            .filter { entity in
                guard let addedDate = entity.addedDate else { return false }
                return date.hasSame(.day, as: addedDate)
            }
            .map { MustDo(mustDoTable: $0) }
    }
    
    func addRepeatMustDo(mustDo: MustDo) {
        let context = self.newBackgroundContext
        let repeatMustDo = RepeatMustDoTable(context: context)
        repeatMustDo.id = mustDo.id
        repeatMustDo.repeatDays = mustDo.repeatDays.map { $0.rawValue }
        repeatMustDo.duration = Double(mustDo.duration)
        repeatMustDo.descriptionTitle = mustDo.discription
        
        let now = Date()
        let currentRawValue = Calendar.current.component(.weekday, from: now)
        if mustDo.repeatDays.contains(where: { $0 == RepeatDay(rawValue: Int32(currentRawValue)) }) {
            let mustDoEntity = MustDoTable(context: context)
            mustDoEntity.descriptionTitle = mustDo.discription
            mustDoEntity.duration = Double(mustDo.duration)
            mustDoEntity.id = mustDo.id
            mustDoEntity.addedDate = now
        }
        
        saveContext(backgroundContext: context)
    }
    
    func migrateTodayRepeatMustDoIfNeeded() {
        let now = Date()
        let flag = fetchRepeatAddFlag(date: now)
        guard flag == false else { return }
        let repeatMustDoList = self.fetch(RepeatMustDoTable.fetchRequest())
        let mustDoEntities = repeatMustDoList.filter { repeatMustDo in
            guard let repeatDays = repeatMustDo.repeatDays else { return false }
            let currentRawValue = Calendar.current.component(.weekday, from: now)
            return repeatDays.contains(Int32(currentRawValue))
        }

        let context = self.newBackgroundContext
        mustDoEntities.forEach { repeatMustDo in
            let mustDoEntity = MustDoTable(context: context)
            mustDoEntity.addedDate = Date()
            mustDoEntity.descriptionTitle = repeatMustDo.descriptionTitle
            mustDoEntity.duration = repeatMustDo.duration
            mustDoEntity.id = UUID()
        }

        let repeatFlag = RepeatAddFlagTable(context: context)
        repeatFlag.date = Date()
        repeatFlag.flag = true

        saveContext(backgroundContext: context)
    }
}

private extension Cache {
    func fetchRepeatAddFlag(date: Date) -> Bool {
        let flags = fetch(RepeatAddFlagTable.fetchRequest())
        let todayFlag = flags.first { flag in
            guard let date = flag.date else { return false }
            return Date().hasSame(.day, as: date)
        }
        return todayFlag?.flag ?? false
    }
}

private extension Date {

    func fullDistance(from date: Date, resultIn component: Calendar.Component, calendar: Calendar = .current) -> Int? {
        calendar.dateComponents([component], from: self, to: date).value(for: component)
    }

    func distance(from date: Date, only component: Calendar.Component, calendar: Calendar = .current) -> Int {
        let days1 = calendar.component(component, from: self)
        let days2 = calendar.component(component, from: date)
        return days1 - days2
    }

    func hasSame(_ component: Calendar.Component, as date: Date) -> Bool {
        return distance(from: date, only: component) == 0
    }
}

extension MustDo {
    init(mustDoTable: MustDoTable) {
        let duration = Int(mustDoTable.duration)
        let discription = mustDoTable.descriptionTitle ?? ""
        let id = mustDoTable.id ?? UUID()
        let addedDate = mustDoTable.addedDate ?? Date()
        
        self.init(repeatDays: [], duration: duration, discription: discription, id: id, addedDate: addedDate)
    }
}
