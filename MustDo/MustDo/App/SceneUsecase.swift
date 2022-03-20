//
//  SceneUsecase.swift
//  MustDo
//
//  Created by 남기범 on 2022/03/16.
//

import Foundation
import FirebaseAuth

protocol SceneUsecaseProtocol {
    func reLogin() async -> Bool
}

protocol SceneUsecaseDependency {
    var repository: SceneRepositoryProtocol { get }
}

extension SceneUsecaseProtocol where Self: SceneUsecaseDependency {
    func reLogin() async -> Bool {
        return await withCheckedContinuation({ (continuation: CheckedContinuation<Bool, Never>) in
            guard let credential = repository.getGoogleAuthCredential()
            else {
                continuation.resume(returning: false)
                return
            }
            
            Auth.auth().signIn(with: credential) { authResult, error in
                if let _ = error {
                    continuation.resume(returning: false)
                    return
                }
                
                continuation.resume(returning: true)
            }
        })
    }
}

class SceneUsecase: SceneUsecaseProtocol, SceneUsecaseDependency {
    let repository: SceneRepositoryProtocol
    
    init(repository: SceneRepositoryProtocol) {
        self.repository = repository
    }
}

extension SceneUsecase {
    static func factory(repository: SceneRepositoryProtocol = SceneRepository()) -> SceneUsecase {
        return SceneUsecase(repository: repository)
    }
}
