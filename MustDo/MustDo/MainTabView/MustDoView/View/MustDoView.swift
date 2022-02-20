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
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct MustDoView_Previews: PreviewProvider {
    static var previews: some View {
        MustDoView()
    }
}
