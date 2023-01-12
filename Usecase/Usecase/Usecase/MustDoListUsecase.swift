//
//  MustDoListUsecase.swift
//  MustDo
//
//  Created by 남기범 on 2022/12/27.
//

import Foundation

public final class MustDoListUsecase {
    private let repository: MustDoRepositoryProtocol
    
    public init(repository: MustDoRepositoryProtocol) {
        self.repository = repository
    }
}

public extension MustDoListUsecase {
    func loadMustDoItems() -> [MustDo] {
        repository.mustDoItems()
    }
}
