//
//  SceneRepository.swift
//  MustDo
//
//  Created by 남기범 on 2022/03/16.
//

import Foundation
import FirebaseAuth

enum UserDefaultKey: String {
    case googleAccessToken
    case googleIDToken
}

protocol SceneRepositoryProtocol {
    func getGoogleAuthCredential() -> AuthCredential?
}

extension SceneRepositoryProtocol {
    func getGoogleAuthCredential() -> AuthCredential? {
        guard let idToken = UserDefaults.standard
                .value(forKey: UserDefaultKey.googleIDToken.rawValue) as? String,
              let accessToken = UserDefaults.standard
                .value(forKey: UserDefaultKey.googleAccessToken.rawValue) as? String
        else { return nil }
        
        return GoogleAuthProvider.credential(
            withIDToken: idToken,
            accessToken: accessToken
        )
    }
}

class SceneRepository: SceneRepositoryProtocol { }
