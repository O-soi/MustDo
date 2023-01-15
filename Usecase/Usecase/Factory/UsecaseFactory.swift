//
//  UsecaseFactory.swift
//  Usecase
//
//  Created by tuna.can on 2023/01/12.
//

import Foundation

public struct UsecaseFactory {
    private let repositoryFactory: RepositoryFactoryProtocol
    
    public init(repositoryFactory: RepositoryFactoryProtocol) {
        self.repositoryFactory = repositoryFactory
    }
}

public extension UsecaseFactory {
    func mustDoList() -> MustDoListUsecase {
        MustDoListUsecase(repository: repositoryFactory.mustDo)
    }
    
    func application() -> ApplicationUsecase {
        ApplicationUsecase(repository: repositoryFactory.application)
    }
}
