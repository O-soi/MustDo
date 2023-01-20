//
//  MustDoRepository.swift
//  MustDo
//
//  Created by tuna.can on 2023/01/12.
//

import Foundation
import Usecase

actor MustDoRepository: MustDoRepositoryProtocol {
    func mustDoItems(page: Int?, limit: Int) async throws -> [MustDo] {
        sleep(1)
        return (0..<limit).map { index in
            MustDo(repeatDays: [.mon],
                   duration: 3600,
                   discription: "\(page ?? 0)page, \(index)index 이건 테스트용 텍스트 입니다. 이건 테스트용 텍스트 입니다. 이건 테스트용 텍스트 입니다. 이건 테스트용 텍스트 입니다. 이건 테스트용 텍스트 입니다.")
        }
    }
}
