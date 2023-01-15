//
//  MustDo.swift
//  MustDo
//
//  Created by 남기범 on 2022/12/27.
//

import Foundation

@objc
public enum RepeatDay: Int32 {
    case mon
    case tues
    case wednes
    case thurs
    case fri
    case satur
    case sun
}

public struct MustDo: Hashable {
    public var repeatDays: [RepeatDay]
    public var duration: Int
    public var discription: String
    public var id = UUID()
    public var addedDate: Date
    public var isCompleted: Bool = false
    
    public init(repeatDays: [RepeatDay], duration: Int, discription: String, id: UUID = UUID(), addedDate: Date = Date()) {
        self.repeatDays = repeatDays
        self.duration = duration
        self.discription = discription
        self.id = id
        self.addedDate = Date()
    }
}
