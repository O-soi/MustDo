//
//  MustDoReducer.swift
//  MustDo
//
//  Created by 남기범 on 2022/04/07.
//

import Foundation
import Combine
import ComposableArchitecture

struct MustDoState {
    @BindableState var mustDoList: [MustDo] = []
}

enum MustDoAction {
    case requestMustDoList(userID: Int)
    case mustDoListResponse(Result<[MustDo], Error>)
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
