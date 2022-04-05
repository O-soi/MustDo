//
//  SceneUsecase.swift
//  MustDo
//
//  Created by 남기범 on 2022/03/16.
//

import Foundation
import FirebaseAuth
import ComposableArchitecture
import Combine

protocol SceneEffectInteractorProtocol {
    func reLoginGoogle() -> Effect<Bool, Error>
}

protocol SceneEffectInteractorDependency {
    var repository: SceneRepositoryProtocol { get }
}

extension SceneEffectInteractorProtocol where Self: SceneEffectInteractorDependency {
    func reLoginGoogle() -> Effect<Bool, Error> {
        guard let credential = repository.getGoogleAuthCredential()
        else { return Effect(value: false) }
        
        return Future { promise in
            Auth.auth().signIn(with: credential) { authResult, error in
                if let error = error {
                    promise(.failure(error))
                    return
                }
                
                promise(.success(true))
            }
        }
        .eraseToEffect()
    }
}

class SceneEffectInteractor: SceneEffectInteractorProtocol, SceneEffectInteractorDependency {
    let repository: SceneRepositoryProtocol
    
    init(repository: SceneRepositoryProtocol) {
        self.repository = repository
    }
}

extension SceneEffectInteractor {
    static func factory(repository: SceneRepositoryProtocol = SceneRepository()) -> SceneEffectInteractor {
        return SceneEffectInteractor(repository: repository)
    }
}
