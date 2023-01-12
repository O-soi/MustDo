//
//  MustDoItemView.swift
//  MustDo
//
//  Created by tuna.can on 2023/01/12.
//

import SwiftUI
import Presenter

struct MustDoItemView: View {
    var mustDo: MustDoItemViewModel
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

struct MustDoItemView_Previews: PreviewProvider {
    static var previews: some View {
        MustDoItemView(mustDo: .dummy)
    }
}
