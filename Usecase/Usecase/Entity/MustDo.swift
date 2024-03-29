//
//  MustDo.swift
//  MustDo
//
//  Created by 남기범 on 2022/12/27.
//

import Foundation

public enum RepeatDay {
    case mon
    case tues
    case wednes
    case thurs
    case fri
    case satur
    case sun
}

public struct MustDo: Identifiable {
    public var repeatDays: [RepeatDay]
    public var duration: Int
    public var discription: String
    public var id = UUID()
    
    public init(repeatDays: [RepeatDay], duration: Int, discription: String, id: UUID = UUID()) {
        self.repeatDays = repeatDays
        self.duration = duration
        self.discription = discription
        self.id = id
    }
}
