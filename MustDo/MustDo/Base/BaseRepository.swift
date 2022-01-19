//
//  BaseRepository.swift
//  MustDo
//
//  Created by 남기범 on 2022/01/05.
//

import Foundation
import Combine

struct MustDo: Identifiable {
    var id: UUID = UUID()
    let description: String
    let hour: Int
}

struct BaseRepository {
    func loadMustDo() -> AnyPublisher<[MustDo], Never> {
        let mustDoList = [1, 2, 3, 4, 5]
            .map { MustDo(description: "할일 목록: \($0)", hour: $0) }
        return Just(mustDoList)
            .eraseToAnyPublisher()
    }
}
