//
//  AppEnvironment.swift
//  MustDo
//
//  Created by tuna.can on 2023/01/12.
//

import Foundation
import Usecase
import Presenter

public struct AppEnvironment {
    private let repositoryFactory: RepositoryFactory
    private let usecaseFactory: UsecaseFactory
    
    public let interactorFactory: InteractorFactory
}

public extension AppEnvironment {
    static func bootstrap() -> AppEnvironment {
        let repositoryFactory = RepositoryFactory()
        let usecaseFactory = UsecaseFactory(repositoryFactory: repositoryFactory)
        let interactorFactory = InteractorFactory(usecaseFactory: usecaseFactory)
        
        return AppEnvironment(repositoryFactory: repositoryFactory,
                              usecaseFactory: usecaseFactory,
                              interactorFactory: interactorFactory)
    }
}
