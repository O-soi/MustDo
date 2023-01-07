//
//  MustDoListView.swift
//  MustDo
//
//  Created by 남기범 on 2022/12/27.
//

import SwiftUI

struct MustDoCell: View {
    var mustDo: MustDo
    var fontType: FontType = .watermelonSalad
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(mustDo.discription)
                    .font(.custom(fontType.rawValue, size: 17))
                    .fontWeight(.semibold)
                
                HStack(spacing: 3) {
                    Image("timer")
                        .frame(width: 20, height: 20)
                    
                    Text("1시간 30분")
                        .font(.custom(fontType.rawValue, size: 15))
                        .fontWeight(.medium)
                }
                .padding(.top, 3.0)
            }
            .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            Spacer(minLength: 0)
        }
    }
}

struct MustDoListView: View {
    @StateObject var interactor = MustDoListInteractor()
    
    var body: some View {
        VStack {
            NavigationView(title: "MustDo")
                .frame(height: 40)
            
            TodayChangeView(
                currentDay: $interactor.currentDay,
                movePrevDay: interactor.movePrevDay,
                moveNextDay: interactor.moveNextDay
            )
            .frame(height: 40)
            
            GeometryReader { gp in
                ScrollView {
                    LazyVGrid(
                        columns: [GridItem(.flexible())],
                        content: {
                            ForEach(interactor.mustDoList) {
                                MustDoCell(mustDo: $0)
                                    .frame(width: gp.size.width - 32)
                                    .background(.white)
                                    .cornerRadius(15)
                                    .padding([.top, .bottom], 5)
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
}

#if DEBUG
struct MustDoListView_Previews: PreviewProvider {
    static var previews: some View {
        MustDoListView()
    }
}
#endif
