//
//  MustDoListView.swift
//  MustDo
//
//  Created by 남기범 on 2022/12/27.
//

import SwiftUI

struct MustDoCell: View {
    var mustDo: MustDo
    
    var body: some View {
        Text("mustDo")
    }
}

struct MustDoListView: View {
    @StateObject var interactor: MustDoListInteractor
    
    var body: some View {
        List(interactor.mustDoList, id: \.id) {
            MustDoCell(mustDo: $0)
        }
        .onAppear {
            interactor.loadMustDoList()
        }
    }
}

#if DEBUG
struct MustDoListView_Previews: PreviewProvider {
    static var previews: some View {
        MustDoListView(interactor: MustDoListInteractor())
    }
}
#endif
