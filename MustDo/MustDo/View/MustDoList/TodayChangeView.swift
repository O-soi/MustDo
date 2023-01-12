//
//  TodayChangeView.swift
//  MustDo
//
//  Created by 남기범 on 2023/01/07.
//

import SwiftUI
import Presenter

struct TodayChangeView: View {
    @Binding var currentDay: String
    var movePrevDay: () -> Void
    var moveNextDay: () -> Void
    var fontType: FontType = .flower
    
    var body: some View {
        HStack(alignment: .center) {
            Image("today_change_prev")
                .frame(width: 20, height: 20)
                .padding(.leading, 16)
                .onTapGesture {
                    movePrevDay()
                }
            
            Spacer()
            
            Text(currentDay)
                .font(.custom(fontType.rawValue, size: 23))
            
            Spacer()
            
            Image("today_change_next")
                .frame(width: 20, height: 20)
                .padding(.trailing, 16)
                .onTapGesture {
                    moveNextDay()
                }
        }
    }
}

struct TodayChangeView_Previews: PreviewProvider {
    static var previews: some View {
        TodayChangeView(
            currentDay: .constant("2022.10.12"),
            movePrevDay: { },
            moveNextDay: { }
        )
    }
}
