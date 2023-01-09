//
//  StyledColorModifier.swift
//  MustDo
//
//  Created by 남기범 on 2023/01/09.
//

import Foundation
import SwiftUI

extension ColorScheme {
    func styledColor(light: Color, dark: Color) -> Color {
        if case .light = self {
            return light
        } else {
            return dark
        }
    }
}

struct StyledColorModifier: ViewModifier {
    @Environment(\.colorScheme) var colorScheme
    var light: Color
    var dark: Color
    
    func body(content: Content) -> some View {
        content
            .foregroundColor(colorScheme.styledColor(light: light, dark: dark))
    }
}
