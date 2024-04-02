//
//  ImgBackgroundView.swift
//  FigmaTestProj
//
//  Created by Vadym Vasylaki on 02.04.2024.
//

import SwiftUI

struct MainBackground<Content>: View where Content: View {
    var imageBackground: String?
//    var overlayContent: String?
    init(imageBackground: String? = nil, overlayContent:  (() -> Content)?) {
        self.imageBackground = imageBackground
        self.overlayContent = overlayContent
    }
    @ViewBuilder let overlayContent: (() -> Content)?
    
    var body: some View {
        ZStack(alignment: .top) {
            Color("MainBackgroundColor")
            ZStack {
                if let overlayContent = overlayContent?() {
                    overlayContent
                        .zIndex(0.1)
                }
                
                if let imageBackground = imageBackground {
                    Image(imageBackground)
                        .resizable()
                        .frame(width: 390, height: 329)
                        .overlay(Color("MainScreenImgColor"))
                        .mask(
                            LinearGradient(
                                gradient: Gradient(stops: [
                                    Gradient.Stop(color: .clear, location: 0.1),
                                    Gradient.Stop(color: .black, location: 0.5),
                                    Gradient.Stop(color: .clear, location: 1)
                                ]),
                                startPoint: .top,
                                endPoint: .bottom
                            )
                        )
                }
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    MainBackground(imageBackground: "MainScreenImg", overlayContent: {
    Image("RouterAccessImg")
    })
}

extension MainBackground {
    init(imageBackground: String? = nil, @ViewBuilder overlayContent: @escaping () -> Content) where Content == EmptyView {
        self.init(imageBackground: imageBackground, overlayContent: nil)
    }
}
