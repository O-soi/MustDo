//
//  NavigationView.swift
//  MustDo
//
//  Created by 남기범 on 2022/12/31.
//

import Foundation
import SwiftUI
import Presenter

struct NavigationView: View {
    var title: String
    var fontType: FontType = .vitro
    var rightButtonTap: (() -> Void)?
    
    var body: some View {
        HStack {
            Text(title)
                .font(.custom(fontType.rawValue, size: 18))
                .modifier(StyledColorModifier(light: .black, dark: .white))
                .padding()
            
            Spacer()
            
            if rightButtonTap != nil {
                Image("circle_plus")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .modifier(StyledColorModifier(light: .black, dark: .white))
                    .padding()
                    .onTapGesture {
                        rightButtonTap?()
                    }
            }
        }
    }
}
