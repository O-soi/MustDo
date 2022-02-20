//
//  AppContentView.swift
//  MustDo
//
//  Created by 남기범 on 2022/02/20.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            MustDoView()
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
