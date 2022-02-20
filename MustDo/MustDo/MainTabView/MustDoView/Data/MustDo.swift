//
//  MustDo.swift
//  MustDo
//
//  Created by 남기범 on 2022/02/20.
//

import Foundation

struct MustDo {
    let title: String
    let description: String
    let gauge: Double
    let repeatTypes: [MustDoRepeatType]
    let elapsedSeconds: Int
    let performedSeconds: Int
}

enum MustDoRepeatType {
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
    case saturday
    case sunday
}

let dummyMustDo: MustDo = MustDo(
    title: "개발하기",
    description: "없음",
    gauge: 71.5,
    repeatTypes: [.monday],
    elapsedSeconds: 7200,
    performedSeconds: 3600
)
