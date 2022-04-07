//
//  MustDoRepository.swift
//  MustDo
//
//  Created by 남기범 on 2022/02/20.
//

import Foundation
import Combine

protocol MustDoRepositoryProtocol {
    func requestMustDoList(userID: Int) -> Future<[MustDo], Error>
    func addMustDo(userID: Int)
    func updateMustDo(userID: Int, percent: Double)
}

class MustDoRepository: MustDoRepositoryProtocol {
//    let local: LocalDB
    
    func requestMustDoList(userID: Int) -> Future<[MustDo], Error> {
        let dummyArray = Array.init(repeating: 0, count: 15)
            .map { _ in
                MustDo(
                    title: "개발하기",
                    description: "없음",
                    repeatTypes: [.monday],
                    elapsedSeconds: Int.random(in: 3600...7200),
                    performedSeconds: Int.random(in: 0...3600)
                )
            }
        
        return Future { promise in
            promise(.success(dummyArray))
        }
    }
    
    func addMustDo(userID: Int) {
        
    }
    
    func updateMustDo(userID: Int, percent: Double) {
        
    }
}
