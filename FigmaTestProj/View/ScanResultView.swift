//
//  ScanResultView.swift
//  FigmaTestProj
//
//  Created by Vadym Vasylaki on 02.04.2024.
//

import SwiftUI

struct ScanResultView: View {
    
    @EnvironmentObject private var router: Router
    
    var networkDevices: [NetworkDevice]?
    
    var body: some View {
        ZStack {
            
            MainBackground(){}
            
            VStack {
                
                VStack {
                    HStack {
                        Text("\(networkDevices?.count ?? 0)")
                            .textStyle(GlowFont(fontColor: .lightPurple))
                        Text("Devices")
                            .fontWeight(.bold)
                            .font(.title)
                            .foregroundStyle(.whiteForeground)
                        
                    }
                    Text("WIFI_Name")
                        .fontWeight(.semibold)
                        .foregroundStyle(.gray)
                }
                
                ScrollView {
                    VStack {
                        if let networkDevices = networkDevices {
                            ForEach(networkDevices, id: \.self) { device in
                                Button(action: {
                                    router.path.append(NavigationPathEnum.deviceDetailsView(networkDevice: device))
                                }, label: {
                                    VStack {
                                        HStack {
                                            
                                            Circle()
                                                .frame(width: 40, alignment: .center)
                                                .foregroundStyle(.mediumPurple)
                                            
                                                .overlay {
                                                    Image("wifi")
                                                        .resizable()
                                                        .scaledToFit()
                                                        .padding(10)
                                                        .overlay(alignment: .topTrailing) {
                                                            if(!device.isAvailable){
                                                                Image(systemName: "exclamationmark.triangle.fill")
                                                                    .foregroundStyle(.red)
                                                                    .offset(x: 7, y: -6)
                                                            }
                                                        }
                                                }
                                                .padding(4)
                                                .padding(.leading, 4)
                                            
                                            VStack(alignment: .leading) {
                                                Text(device.networkName ?? "-")
                                                    .foregroundStyle(.whiteForeground)
                                                    .fontWeight(.bold)
                                                
                                                Text(device.ipAddress)
                                                    .fontWeight(.semibold)
                                                    .foregroundStyle(.gray)
                                            }
                                            
                                            Spacer()
                                            
                                            Image(systemName: "chevron.forward")
                                                .foregroundStyle(.whiteForeground)
                                            Divider()
                                        }
                                        Color.gray.frame(height: 1 / UIScreen.main.scale)
                                    }
                                })
                                
                            }
                        }
                        
                    }
                }
                .scrollIndicators(.never)
                .background(.darkPurple)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .padding()
                
            }
            .toolbar(content: {
                ToolbarItemGroup(placement: .principal) {
                    HStack {
                        Button(action: {
                            router.reset()
                        }, label: {
                            Image(systemName: "chevron.left")
                                .tint(.lightPurple)
                        })
                        Spacer()
                        Text("Result")
                            .fontWeight(.heavy)
                            .foregroundStyle(.whiteForeground)
                        Spacer()
                    }
                }
            })
        }
    }
}
#Preview {
    ScanResultView(networkDevices: NetworkScanerVM.mocData)
}
