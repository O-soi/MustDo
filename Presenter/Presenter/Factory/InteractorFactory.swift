//
//  InteractorFactory.swift
//  Presenter
//
//  Created by tuna.can on 2023/01/12.
//

import Foundation
import Usecase

import Foundation

public struct InteractorFactory {
    private let usecaseFactory: UsecaseFactory
    
    public init(usecaseFactory: UsecaseFactory) {
        self.usecaseFactory = usecaseFactory
    }
}

public extension InteractorFactory {
    var application: ApplicationInteractor {
        ApplicationInteractor(usecase: usecaseFactory.application())
    }
    
    var mustDoList: MustDoListInteractor {
        MustDoListInteractor(usecase: usecaseFactory.mustDoList())
    }
}
