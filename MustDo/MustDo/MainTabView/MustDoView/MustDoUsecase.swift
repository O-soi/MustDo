//
//  MustDoUsecase.swift
//  MustDo
//
//  Created by 남기범 on 2022/02/20.
//

import Foundation
import Combine

protocol MustDoUsecaseOutputProtocol {
    func requestMustDoList(userID: Int) -> AnyPublisher<[MustDo], Never>
}

protocol MustDoUsecaseInputProtocol {
    func addMustDo(userID: Int)
    func updateMustDo(userID: Int, percent: Double)
}

protocol MustDoUsecaseProtocol: MustDoUsecaseInputProtocol, MustDoUsecaseOutputProtocol { }

protocol MustDoDependency {
    var repository: MustDoRepositoryProtocol { get }
}

extension MustDoUsecaseInputProtocol where Self: MustDoDependency {
    func requestMustDoList(userID: Int) -> AnyPublisher<[MustDo], Never> {
        return repository.requestMustDoList(userID: userID)
    }
}

extension MustDoUsecaseOutputProtocol where Self: MustDoDependency {
    func addMustDo(userID: Int) {
        repository.addMustDo(userID: userID)
    }
    
    func updateMustDo(userID: Int, percent: Double) {
        repository.updateMustDo(userID: userID, percent: percent)
    }
}

class MustDoUsecase: MustDoUsecaseProtocol, MustDoDependency {
    var repository: MustDoRepositoryProtocol
    
    init(repository: MustDoRepositoryProtocol) {
        self.repository = repository
    }
}
