//
//  MustDoRepository.swift
//  MustDo
//
//  Created by 남기범 on 2022/02/20.
//

import Foundation
import Combine

protocol MustDoRepositoryProtocol {
    func requestMustDoList(userID: Int) -> AnyPublisher<[MustDo], Never>
    func addMustDo(userID: Int)
    func updateMustDo(userID: Int, percent: Double)
}

class MustDoRepository: MustDoRepositoryProtocol {
//    let local: LocalDB
    
    func requestMustDoList(userID: Int) -> AnyPublisher<[MustDo], Never> {
        return Just([dummyMustDo])
            .eraseToAnyPublisher()
    }
    
    func addMustDo(userID: Int) {
        
    }
    
    func updateMustDo(userID: Int, percent: Double) {
        
    }
}
