//
//  RepositoryFactory.swift
//  MustDo
//
//  Created by tuna.can on 2023/01/12.
//

import Foundation
import Usecase

public struct RepositoryFactory: RepositoryFactoryProtocol {
    public var application: ApplicationRepositoryProtocol {
        ApplicationRepository()
    }
    
    public var mustDo: MustDoRepositoryProtocol {
        MustDoRepository()
    }
}
