//
//  DeviceDetailsView.swift
//  FigmaTestProj
//
//  Created by Vadym Vasylaki on 02.04.2024.
//

import SwiftUI

struct DeviceDetailsView: View {
    
    @EnvironmentObject private var router: Router
    
    var networkDevice: NetworkDevice
    
    var body: some View {
        ZStack {
            MainBackground(imageBackground: "MainScreenImg") {
                HStack {
                    Image("wifiCircle")
                        .resizable()
                        .scaledToFit()
                        .foregroundStyle(.whiteForeground)
                        .frame(width: 116, height: 116)
                        .overlay(alignment: .bottomTrailing) {
                            Image(systemName: networkDevice.isAvailable ? "exclamationmark.triangle.fill"
                                  : "exclamationmark.triangle.fill")
                            .resizable()
                            .scaledToFit()
                            .foregroundStyle(networkDevice.isAvailable ? .foregroundGreen : .foregroundIconRed)
                            .frame(width: 52, height: 45)
                            .offset(x: 0, y: -4)
                        }
                }
                .padding(.bottom)
            }
            
            VStack {
                Text("Camera")
                    .textStyle(GlowFont(fontColor: networkDevice.isAvailable ? .lightPurple : .lightRed))
                
                Text(networkDevice.ipAddress)
                    .foregroundStyle(.whiteForeground)
                
                Group {
                    Color.gray.frame(height: 1 / UIScreen.main.scale)
                    DetailField(title: "Content type", networkDeviceInfo: networkDevice.connectionType)
                    Color.gray.frame(height: 1 / UIScreen.main.scale)
                    DetailField(title: "IP Address", networkDeviceInfo: networkDevice.ipAddress)
                    Color.gray.frame(height: 1 / UIScreen.main.scale)
                    DetailField(title: "MAC Address", networkDeviceInfo: networkDevice.MACAddress ?? "Not Available")
                    Color.gray.frame(height: 1 / UIScreen.main.scale)
                    DetailField(title: "Hostname", networkDeviceInfo: networkDevice.hostName)
                        .padding(.bottom)
                }
            }
            .background(.darkPurple)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .padding()
        }
        .toolbar(content: {
            ToolbarItemGroup(placement: .principal) {
                HStack {
                    Button(action: {
                        router.path.removeLast()
                    }, label: {
                        Image(systemName: "chevron.left")
                            .tint(.lightPurple)
                    })
                    .padding(.leading, 0)
                    
                    Spacer()
                    
                    Text("Device Details")
                        .fontWeight(.heavy)
                        .foregroundStyle(.whiteForeground)
                    Spacer()
                }
            }
        })
    }
}

#Preview {
    DeviceDetailsView(networkDevice: NetworkScanerVM.mocData[0])
}

struct DetailField: View {
    var title: String
    var networkDeviceInfo: String
    var body: some View {
        VStack{
            HStack {
                Text(title)
                    .foregroundStyle(.whiteForeground)
                    .fontWeight(.bold)
                Spacer()
                Text(networkDeviceInfo)
                    .fontWeight(.semibold)
                    .foregroundStyle(.gray)
            }
        }
        .padding(10)
    }
}
