//
//  MagneticDetection.swift
//  FigmaTestProj
//
//  Created by Vadym Vasylaki on 02.04.2024.
//

import SwiftUI

struct MagneticDetection: View {
    
    @EnvironmentObject private var router: Router
    
    @State private var rotate: Bool = false
    @State private var rotateDegrees: Int = 180
    @State private var addedDegrees: Int = 0
    @State private var timer: Timer?
    
    var percentage: Double {
        return (Double(addedDegrees) / 180) * 100
        }
    
    var body: some View {
        ZStack {
            MainBackground(imageBackground: "SecondaryMainScreenImg") {
                Image("MagnetAccessImg")
            }
            
            VStack {
                Spacer()
                
                Image("ScaleIndicator")
                    .overlay(alignment: .center) {
                        ZStack {
                            Circle()
                                .frame(width: 30)
                                .foregroundStyle(.white)
                            ArcShape()
                                .frame(width: 85, height: 150)
                                .foregroundStyle(.white)
                                .rotationEffect(.degrees(180), anchor: .trailing)
                        }
                        .rotationEffect(.degrees(rotate ? Double(rotateDegrees) : 180))
                        .animation(.easeInOut(duration: 2), value: rotate)
                        .padding(.top, 150)
                    }
                    .padding()
                
                Text("\(Int(percentage)) µT")
                    .foregroundStyle(.whiteForeground)
                    .padding(.top, 30)
                
                Spacer()
            }
            .overlay(alignment: .bottom) {
                
                Button(action: {
                    rotate.toggle()
                    
                    if(rotate) {
                        addedDegrees = 0
                        rotateDegrees = 180
                        startIncrementing()
                    }else {
                        stopIncrementing()
                    }
                }, label: {
                    Text(rotate ? "Stop" : "Search")
                        .frame(maxWidth: .infinity)
                })
                .buttonStyle(PurpuleRoundedBtnStyle())
                .padding()
            }
            .toolbar(content: {
                ToolbarItemGroup(placement: .principal) {
                    HStack {
                        Button(action: {
                            router.path.removeLast()
                        }, label: {
                            HStack {
                                Image(systemName: "chevron.left")
                                Text("Main")
                            }
                            .tint(.lightPurple)
                        })
                        Spacer()
                        Text("Magnetic Detection")
                            .fontWeight(.heavy)
                            .foregroundStyle(.whiteForeground)
                        Spacer()
                    }
                }
            })
        }
    }
    
    func startIncrementing() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { timer in
            self.rotateDegrees += 1
            self.addedDegrees += 1
            if(addedDegrees >= 180) {
                stopIncrementing()
            }
        }
    }
    
    func stopIncrementing() {
        timer?.invalidate()
        timer = nil
    }
    
}

#Preview {
    MagneticDetection()
}

struct ArcShape: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: rect.midX, y: rect.midY))
            path.addArc(
                center: CGPoint(x: rect.midX, y: rect.midY),
                radius: rect.height / 2,
                startAngle: Angle(degrees: -3),
                endAngle: Angle(degrees: 4),
                clockwise: false
            )
            
        }
    }
}
