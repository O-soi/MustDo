//
//  MustDo.swift
//  MustDo
//
//  Created by 남기범 on 2022/12/27.
//

import Foundation

enum RepeatDay {
    case mon
    case tues
    case wednes
    case thurs
    case fri
    case satur
    case sun
}

struct MustDo: Identifiable {
    var repeatDays: [RepeatDay]
    var duration: Int
    var discription: String
    var id = UUID()
}
