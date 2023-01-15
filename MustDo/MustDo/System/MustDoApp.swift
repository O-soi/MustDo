//
//  MustDoApp.swift
//  MustDo
//
//  Created by tuna.can on 2023/01/11.
//

import SwiftUI
import Presenter
import Usecase

@main
struct MustDoApp: App {
    private let appEnvironment: AppEnvironment
    private let applicationInteractor: ApplicationInteractor
    
    init() {
        self.appEnvironment = AppEnvironment.bootstrap()
        self.applicationInteractor = appEnvironment.interactorFactory.application
        applicationInteractor.initialized()
    }
    
    var body: some Scene {
        WindowGroup {
            MustDoListView(interactor: appEnvironment.interactorFactory.mustDoList)
        }
    }
}
