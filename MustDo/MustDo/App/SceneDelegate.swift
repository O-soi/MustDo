//
//  SceneDelegate.swift
//  MustDo
//
//  Created by 남기범 on 2021/12/20.
//

import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    var viewModel = SceneViewModel.factory()

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            
            let baseView = MainTabView()
            window.rootViewController = UIHostingController(rootView: baseView)
            
            Task {
                let isSuccededReLogin = await self.viewModel.reLogin()
                
                if isSuccededReLogin == true {
                    let baseView = MainTabView()
                    window.rootViewController = UIHostingController(rootView: baseView)
                    self.window = window
                    window.makeKeyAndVisible()
                    
                } else {
                    let loginView = LoginView()
                    window.rootViewController = UIHostingController(rootView: loginView)
                    self.window = window
                    window.makeKeyAndVisible()
                }
            }
        }
        
        guard let _ = (scene as? UIWindowScene) else { return }
    }
}
