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

protocol SceneInteractorProtocol {
    func reLoginGoogle() -> Effect<Bool, Error>
}

protocol SceneInteractorDependency {
    var repository: SceneRepositoryProtocol { get }
}

extension SceneInteractorProtocol where Self: SceneInteractorDependency {
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

class SceneInteractor: SceneInteractorProtocol, SceneInteractorDependency {
    let repository: SceneRepositoryProtocol
    
    init(repository: SceneRepositoryProtocol) {
        self.repository = repository
    }
}

extension SceneInteractor {
    static func factory(repository: SceneRepositoryProtocol = SceneRepository()) -> SceneInteractor {
        return SceneInteractor(repository: repository)
    }
}
