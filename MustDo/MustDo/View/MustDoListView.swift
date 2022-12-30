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
        HStack {
            VStack(alignment: .leading) {
                Text(mustDo.discription)
                    .font(.system(size: 16, weight: .medium))
                
                Text("⏰ 1시간 30분")
                    .font(.system(size: 14, weight: .medium))
                    .padding(.top, 3.0)
            }
            .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        }
        .background(.white)
        .cornerRadius(15)
    }
}

struct MustDoListView: View {
    @StateObject var interactor = MustDoListInteractor()
    
    var body: some View {
        VStack {
            NavigationView()
                .frame(height: 40)
            
            ScrollView {
                LazyVGrid(
                    columns: [GridItem(.flexible())],
                    content: {
                        ForEach(interactor.mustDoList) {
                            MustDoCell(mustDo: $0)
                                .padding(5)
                        }
                    })
                .onAppear {
                    interactor.loadMustDoList()
                }
            }
            .padding(.top, 8)
            .background(Color.init(hex: "F6F6F6"))
        }
    }
}

#if DEBUG
struct MustDoListView_Previews: PreviewProvider {
    static var previews: some View {
        MustDoListView()
    }
}
#endif
