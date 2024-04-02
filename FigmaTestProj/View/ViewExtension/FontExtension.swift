//
//  FontExtension.swift
//  FigmaTestProj
//
//  Created by Vadym Vasylaki on 01.04.2024.
//

import SwiftUI

struct GlowFont: ViewModifier {
    var fontColor: Color
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .fontWeight(.bold)
            .foregroundColor(fontColor)
            .shadow(color: .shadowLightPurle, radius: 10)
            .brightness(0.1)
            .blur(radius: 0.3)
    }
}

extension Text {
    func textStyle<Style: ViewModifier>(_ style: Style) -> some View {
        ModifiedContent(content: self, modifier: style)
    }
}
