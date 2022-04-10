//
//  AppContentView.swift
//  MustDo
//
//  Created by 남기범 on 2022/02/20.
//

import SwiftUI
import ComposableArchitecture

struct MainTabView: View {
    
    init() {
        UITabBar.appearance().backgroundColor = .white
    }
    
    var body: some View {
        TabView {
            MustDoView(store: Store(
                initialState: MustDoState(),
                reducer: mustDoReducer,
                environment: MustDoEnvironment(
                    queue: DispatchQueue.main.eraseToAnyScheduler(),
                    interactor: MustDoInteractor(repository: MustDoRepository())
                )))
                .tabItem {
                    Text("MustDo")
                }
            SettingView()
                .tabItem {
                    Text("Setting")
                }
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
