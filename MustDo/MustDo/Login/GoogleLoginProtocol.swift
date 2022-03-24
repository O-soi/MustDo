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
        guard let clientID = FirebaseApp.app()?.options.clientID
        else { return }
        
        let config = GIDConfiguration(clientID: clientID)
        let user = try await signInGID(config: config)
        try await signInGoogleAuth(user: user)
    }
    
    private func signInGID(config: GIDConfiguration) async throws -> GIDGoogleUser? {
        return try await withCheckedThrowingContinuation({ (continuation: CheckedContinuation<GIDGoogleUser?, Error>) in
            DispatchQueue.main.async {
                GIDSignIn.sharedInstance.signIn(with: config, presenting: self) { user, error in
                    if let error = error {
                        continuation.resume(throwing: error)
                        return
                    }
                    
                    continuation.resume(returning: user)
                }
            }
        })
    }
    
    private func signInGoogleAuth(user: GIDGoogleUser?) async throws {
        guard let authentication = user?.authentication,
              let idToken = authentication.idToken
        else { return }
        
        saveGoogleLoginInfo(
            idToken: idToken,
            accessToken: authentication.accessToken
        )
        
        let credential = GoogleAuthProvider.credential(
            withIDToken: idToken,
            accessToken: authentication.accessToken
        )
        
        return try await withCheckedThrowingContinuation({ (continuation: CheckedContinuation<Void, Error>) in
            Auth.auth().signIn(with: credential) { authResult, error in
                if let error = error {
                    continuation.resume(throwing: error)
                    return
                }
                
                continuation.resume(returning: ())
            }
        })
    }
    
    private func saveGoogleLoginInfo(idToken: String, accessToken: String) {
        UserDefaults.standard.set(
            accessToken,
            forKey: UserDefaultKey.googleAccessToken.rawValue
        )
        
        UserDefaults.standard.set(
            idToken,
            forKey: UserDefaultKey.googleIDToken.rawValue
        )
    }
}
