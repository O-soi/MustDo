//
//  NavigationView.swift
//  MustDo
//
//  Created by 남기범 on 2022/12/31.
//

import Foundation
import SwiftUI

struct NavigationView: View {
    var title: String
    var fontType: FontType = .watermelonSalad
    
    var body: some View {
        Text(title)
            .font(.custom(fontType.rawValue, size: 16))
    }
}
