//
//  MustDoView.swift
//  MustDo
//
//  Created by 남기범 on 2022/02/20.
//

import SwiftUI
import ComposableArchitecture

struct MustDoView: View {
    let store: Store<MustDoState, MustDoAction>
    
    var body: some View {
        WithViewStore(self.store) { viewStore in
            NavigationView {
                ScrollView {
                    LazyVStack(alignment: .leading, spacing: 3) {
                        ForEach(viewStore.state.mustDoList) { mustDo in
                            NavigationLink {
                                CirecleTimerView()
                            } label: {
                                MustDoCell(mustDo: mustDo)
                                    .frame(height: 50)
                                    .listRowInsets(.init())
                                    .listRowSeparator(.hidden)
                            }
                        }
                    }
                }
                .navigationBarHidden(true)
                .background(Color.init(hex: "F1F1F1"))
            }
            .onAppear {
                viewStore.send(.requestMustDoList(userID: 0))
            }
        }
    }
}

struct MustDoView_Previews: PreviewProvider {
    static var previews: some View {
        MustDoView(store: Store(
            initialState: MustDoState(),
            reducer: mustDoReducer,
            environment: MustDoEnvironment(
                queue: DispatchQueue.main.eraseToAnyScheduler(),
                interactor: MustDoInteractor(repository: MustDoRepository())
            ))
        )
    }
}
