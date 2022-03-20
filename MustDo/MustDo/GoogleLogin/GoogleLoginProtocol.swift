//
//  LoginUsecase.swift
//  MustDo
//
//  Created by 남기범 on 2022/03/13.
//

import Foundation
import GoogleSignIn
import FirebaseCore
import FirebaseAuth

protocol GoogleLoginProtocol {
    func requestGoogleLogin() async throws
}

extension GoogleLoginProtocol where Self: UIViewController {
    func requestGoogleLogin() async throws {
        return try await withCheckedThrowingContinuation({ (continuation: CheckedContinuation<Void, Error>) in
            guard let clientID = FirebaseApp.app()?.options.clientID
            else { return }
            
            let config = GIDConfiguration(clientID: clientID)
            
            GIDSignIn.sharedInstance.signIn(with: config, presenting: self) { user, error in
                if let error = error {
                    continuation.resume(throwing: error)
                    return
                }
                
                guard let authentication = user?.authentication,
                      let idToken = authentication.idToken
                else { return }
                
                let credential = GoogleAuthProvider.credential(
                    withIDToken: idToken,
                    accessToken: authentication.accessToken
                )
                
                Auth.auth().signIn(with: credential) { authResult, error in
                    if let error = error {
                        continuation.resume(throwing: error)
                        return
                    }
                    
                    continuation.resume(returning: ())
                }
            }
        })
    }
    
    
}
