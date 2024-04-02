//
//  PurpuleRoundedBtn.swift
//  FigmaTestProj
//
//  Created by Vadym Vasylaki on 01.04.2024.
//

import SwiftUI

struct PurpuleRoundedBtnStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        return configuration.label
            .padding()
            .padding(.horizontal)
            .foregroundStyle(.white)
            .background(
                Capsule()
                    .fill(.lightPurple)
                )
            .font(.system(size: 20, weight: .bold))
        
    }
}
