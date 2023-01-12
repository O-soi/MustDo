//
//  MustDoApp.swift
//  MustDo
//
//  Created by tuna.can on 2023/01/11.
//

import SwiftUI
import Presenter

@main
struct MustDoApp: App {
    private let appEnvironment: AppEnvironment
    
    init() {
        self.appEnvironment = AppEnvironment.bootstrap()
    }
    
    var body: some Scene {
        WindowGroup {
            MustDoListView(interactor: appEnvironment.interactorFactory.mustDoList)
        }
    }
}
