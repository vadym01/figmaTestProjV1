//
//  ContentView.swift
//  FigmaTestProj
//
//  Created by Vadym Vasylaki on 01.04.2024.
//

import SwiftUI





struct ContentView: View {
    
    @EnvironmentObject private var router: Router
    private var networkDevices: [NetworkDevice]?
    
    private let threeColumnGrid = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationStack(path: $router.path) {
            //        NavigationStack {
            
            ZStack {
                MainBackground(imageBackground: "MainScreenImg") {
                    Image("RouterAccessImg")
                }
                VStack {
                    Spacer()
                    VStack {
                        Text("Current Wi-Fi")
                            .foregroundStyle(.whiteForeground)
                            .fontWeight(.semibold)
                        Text("WIFI_Name")
                            .textStyle(GlowFont(fontColor: .lightPurple))
                        
                        Text("Ready to Scan this network")
                            .fontWeight(.semibold)
                            .foregroundStyle(.gray)
                        
                        Button {
                            router.path.append(NavigationPathEnum.networkScanView)
                        } label: {
                            Text("Scan current network")
                                .frame(maxWidth: .infinity)
                        }
                        .buttonStyle(PurpuleRoundedBtnStyle())
                        .padding([.leading, .trailing])
                    }
                    .background(.darkPurple)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .padding()
                    
                    LazyVGrid(columns: threeColumnGrid, alignment: .center, spacing: 20) {
                        ForEach(MainScreenButtonsEnum.allCases, id: \.self) { btnLink in
                            Button(action: {
                                btnLink.navigationAction(router: router)
                            }, label: {
                                VStack {
                                    btnLink.btnIcon
                                    Text(btnLink.btnDescription)
                                        .font(.system(size: 17, weight: .bold))
                                        .foregroundStyle(.whiteForeground)
                                }
                            })
                            .frame(minWidth: 140, minHeight: 140)
                            .background(.mediumPurple)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .padding([.leading, .trailing])
                        }
                    }
                    .padding(.bottom)
                }
            }
            .toolbar(content: {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Image(systemName: "slider.vertical.3")
                            .fontWeight(.bold)
                            .foregroundStyle(.whiteForeground)
                    })
                }
            })
            .navigationDestination(for: NavigationPathEnum.self) { navigate in
                navigate.navigationView
            }
        }
    }
}

#Preview {
    ContentView()
}
