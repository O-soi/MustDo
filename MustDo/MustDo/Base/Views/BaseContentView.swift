//
//  BaseContentView.swift
//  MustDo
//
//  Created by 남기범 on 2021/12/21.
//

import SwiftUI

private struct InteractorKey: EnvironmentKey {
    typealias Value = BaseInteractor
    
    static let defaultValue: Value = BaseInteractor(repository: BaseRepository(), state: AppState())
}

extension EnvironmentValues {
    var interactors: BaseInteractor {
        get { self[InteractorKey.self] }
        set { self[InteractorKey.self] = newValue }
    }
}

struct BaseContentView: View {
    @EnvironmentObject var appState: AppState
    @Environment(\.interactors) var interactors: BaseInteractor
    
    var body: some View {
        NavigationView {
            List(appState.listDataSource) { dataSource in
                NavigationLink(destination: MustDoDetailView()) {
                    MustDoCell(dataSource: dataSource)
                }
            }
            .navigationBarTitle("MustDo")
            .navigationBarHidden(true)
            .onAppear {
                interactors.loadMustDo()
            }
        }
    }
}

struct MustDoCell: View {
    let dataSource: MustDo
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("\(dataSource.description)")
                .font(.headline)
            HStack {
                Text("소요시간: ")
                Text("\(dataSource.hour) hours")
            }
            .font(.subheadline)
        }
    }
}

struct BaseContentView_Previews: PreviewProvider {
    static var previews: some View {
        let appState = AppState()
        let interactor = BaseInteractor(repository: BaseRepository(),
                                        state: appState)
        
        BaseContentView()
            .environmentObject(appState)
            .environment(\.interactors, interactor)
    }
}
