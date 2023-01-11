//
//  MustDoCellViewModel.swift
//  Presenter
//
//  Created by tuna.can on 2023/01/11.
//

import Foundation

public struct MustDoCellViewModel: Identifiable {
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

public extension MustDoCellViewModel {
    enum RepeatDay {
        case mon
        case tues
        case wednes
        case thurs
        case fri
        case satur
        case sun
    }
}
