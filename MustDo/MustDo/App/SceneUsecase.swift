//
//  SceneUsecase.swift
//  MustDo
//
//  Created by 남기범 on 2022/03/16.
//

import Foundation
import FirebaseAuth

protocol SceneUsecaseProtocol {
    func reLogin() async throws
}

protocol SceneUsecaseDependency {
    var repository: SceneRepositoryProtocol { get }
}

extension SceneUsecaseProtocol where Self: SceneUsecaseDependency {
    func reLogin() async throws {
        return try await withCheckedThrowingContinuation({ (continuation: CheckedContinuation<Void, Error>) in
            guard let credential = repository.getGoogleAuthCredential()
            else {
                continuation.resume(throwing: NSError())
                return
            }
            
            Auth.auth().signIn(with: credential) { authResult, error in
                if let error = error {
                    continuation.resume(throwing: error)
                    return
                }
                
                continuation.resume(returning: ())
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
