//
//  LoginHostingController.swift
//  MustDo
//
//  Created by 남기범 on 2022/03/14.
//

import Foundation
import SwiftUI
import Combine

class LoginHostingController: UIHostingController<LoginView>, GoogleLoginProtocol {
    private var cancellables = Set<AnyCancellable>()
    
    init(rootView: LoginView, loginEventPublisher: AnyPublisher<Void, Never>) {
        super.init(rootView: rootView)
        
        loginEventPublisher
            .sink(receiveValue: {
                Task.detached(priority: .background) {
                    try await self.requestGoogleLogin()
                }
            })
            .store(in: &cancellables)
    }
    
    @MainActor @objc required dynamic init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
