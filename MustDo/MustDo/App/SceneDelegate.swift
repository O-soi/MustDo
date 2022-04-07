//
//  SceneDelegate.swift
//  MustDo
//
//  Created by 남기범 on 2021/12/20.
//

import UIKit
import SwiftUI
import ComposableArchitecture
import Combine

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    private var sceneStore = ViewStore.init(
        Store(
            initialState: SceneState(),
            reducer: sceneReducer,
            environment: SceneEnvironment(
                queue: DispatchQueue.main.eraseToAnyScheduler(),
                interactor: SceneInteractor.factory()
            )
        )
    )
    private var cancellables = Set<AnyCancellable>()

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            
            sceneStore
                .publisher
                .isSucceededGoogleLogin
                .compactMap { $0 }
                .sink { [weak self] isSucceeded in
                    self?.setRootViewController(isSucceeded, window: window)
                }
                .store(in: &cancellables)
            
            sceneStore.send(.reLogin)
        }
        
        guard let _ = (scene as? UIWindowScene) else { return }
    }
    
    private func setRootViewController(_ isSucceededGoogleLogin: Bool, window: UIWindow) {
        if isSucceededGoogleLogin == true {
            let baseView = MainTabView()
            window.rootViewController = UIHostingController(rootView: baseView)
            self.window = window
            window.makeKeyAndVisible()
            
        } else {
            let loginViewController = LoginViewController(nibName: nil, bundle: nil)
            window.rootViewController = loginViewController
            self.window = window
            window.makeKeyAndVisible()
        }
    }
}
