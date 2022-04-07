//
//  SceneReducer.swift
//  MustDo
//
//  Created by 남기범 on 2022/04/06.
//

import Foundation
import ComposableArchitecture
import Combine

struct SceneState: Equatable {
    var isSucceededGoogleLogin: Bool?
}

enum SceneAction {
    case reLogin
    case reLoginResponse(Result<Bool, Error>)
}

struct SceneEnvironment {
    var queue: AnySchedulerOf<DispatchQueue>
    var interactor: SceneInteractorProtocol
}

let sceneReducer = Reducer<SceneState, SceneAction, SceneEnvironment> { state, action, environment in
    switch action {
    case .reLogin:
        return environment
            .interactor
            .reLoginGoogle()
            .receive(on: environment.queue)
            .catchToEffect()
            .map(SceneAction.reLoginResponse)
        
    case let .reLoginResponse(.success(result)):
        state.isSucceededGoogleLogin = result
        return .none
        
    case let .reLoginResponse(.failure(error)):
        state.isSucceededGoogleLogin = false
        print("[ERROR] error message: \(error.localizedDescription)")
        return .none
    }
}
