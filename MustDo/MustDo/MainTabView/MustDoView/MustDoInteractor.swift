//
//  MustDoUsecase.swift
//  MustDo
//
//  Created by 남기범 on 2022/02/20.
//

import Foundation
import Combine
import ComposableArchitecture

protocol MustDoInteractorOutputProtocol {
    func requestMustDoList(userID: Int) -> Effect<[MustDo], Error>
}

protocol MustDoInteractorInputProtocol {
    func addMustDo(userID: Int)
    func updateMustDo(userID: Int, percent: Double)
}

protocol MustDoInteractorProtocol: MustDoInteractorInputProtocol, MustDoInteractorOutputProtocol { }

protocol MustDoDependency {
    var repository: MustDoRepositoryProtocol { get }
}

extension MustDoInteractorInputProtocol where Self: MustDoDependency {
    func requestMustDoList(userID: Int) -> Effect<[MustDo], Error> {
        return repository
            .requestMustDoList(userID: userID)
            .eraseToEffect()
    }
}

extension MustDoInteractorOutputProtocol where Self: MustDoDependency {
    func addMustDo(userID: Int) {
        repository.addMustDo(userID: userID)
    }
    
    func updateMustDo(userID: Int, percent: Double) {
        repository.updateMustDo(userID: userID, percent: percent)
    }
}

class MustDoInteractor: MustDoInteractorProtocol, MustDoDependency {
    var repository: MustDoRepositoryProtocol
    
    init(repository: MustDoRepositoryProtocol) {
        self.repository = repository
    }
}
