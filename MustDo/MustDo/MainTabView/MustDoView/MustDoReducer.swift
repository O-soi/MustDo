//
//  MustDoReducer.swift
//  MustDo
//
//  Created by 남기범 on 2022/04/07.
//

import Foundation
import Combine
import ComposableArchitecture

struct MustDoState: Equatable {
    static func == (lhs: MustDoState, rhs: MustDoState) -> Bool {
        return lhs.mustDoList == rhs.mustDoList
    }
    
    var mustDoList: [MustDo] = []
}

enum MustDoAction: Equatable {
    static func == (lhs: MustDoAction, rhs: MustDoAction) -> Bool {
        switch (lhs, rhs) {
        case let (.requestMustDoList(userID: lhsID), .requestMustDoList(userID: rhsID)):
            return lhsID == rhsID
        case let (.mustDoListResponse(.success(lhsResult)), .mustDoListResponse(.success(rhsResult))):
            return lhsResult == rhsResult
        default:
            return false
        }
    }
    
    case requestMustDoList(userID: Int)
    case mustDoListResponse(Result<[MustDo], Error>)
}

extension Array where Element == MustDo {
    static func == (lhs: [MustDo], rhs: [MustDo]) -> Bool {
        let count = lhs.filter { mustDo in
            rhs.filter { $0.id == mustDo.id }.count == 1
        }.count
        
        return lhs.count == count
        && lhs.count == rhs.count
    }
}

struct MustDoEnvironment {
    var queue: AnySchedulerOf<DispatchQueue>
    var interactor: MustDoInteractorProtocol
}

let mustDoReducer = Reducer<MustDoState, MustDoAction, MustDoEnvironment> { state, action, environment in
    switch action {
    case let .requestMustDoList(userID):
        return environment
            .interactor
            .requestMustDoList(userID: userID)
            .receive(on: environment.queue)
            .catchToEffect()
            .map(MustDoAction.mustDoListResponse)
        
    case let .mustDoListResponse(.success(result)):
        state.mustDoList = result
        return .none
        
    case let .mustDoListResponse(.failure(error)):
        print("[ERROR] error message: \(error.localizedDescription)")
        return .none
    }
}
