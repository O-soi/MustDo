//
//  MustDoView.swift
//  MustDo
//
//  Created by 남기범 on 2022/02/20.
//

import SwiftUI

struct MustDoView: View {
    @StateObject private var viewModel = MustDoViewModel.factory()
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack(spacing: 10) {
                    ForEach(viewModel.mustDoList) { mustDo in
                        NavigationLink {
                            CirecleTimerView()
                        } label: {
                            MustDoCell(mustDo: mustDo)
                                .background(Color.white)
                                .cornerRadius(15)
                        }
                    }
                }
                .padding()
                .onAppear(perform: {
                    Task.detached(priority: .background) {
                        try? await viewModel.requestMustDoList(userID: 0)
                    }
                })
            }
            .background(Color.blue.opacity(0.1))
            .navigationTitle("MustDo")
        }
    }
}

struct MustDoView_Previews: PreviewProvider {
    static var previews: some View {
        MustDoView()
    }
}
