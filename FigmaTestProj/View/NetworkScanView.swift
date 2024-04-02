//
//  NetworkScanView.swift
//  FigmaTestProj
//
//  Created by Vadym Vasylaki on 01.04.2024.
//

import SwiftUI
import Lottie
import SystemConfiguration.CaptiveNetwork

struct NetworkScanView: View {
    
    @State private var networkDevices: [NetworkDevice]?
    @State private var initScanning: Bool = true
    
    @EnvironmentObject private var router: Router
    private var networkScanner = NetworkScanerVM()
    
    var body: some View {
        ZStack {
            MainBackground(){}
            
            VStack {
                Spacer()
                Text("Scanning Your Wi-Fi")
                    .foregroundStyle(.whiteForeground)
                    .fontWeight(.semibold)
                Text("TLind_246_Ip")
                    .textStyle(GlowFont(fontColor: .lightPurple))
                
                Spacer()
                if (initScanning) {
                    LottieView(animation: .named("hc6 s"))
                        .playbackMode(.playing(.toProgress(1, loopMode: .playOnce)))
                        .animationDidFinish { completed in
                            networkDevices = networkScanner.loadJsonData(from: "networkDevices.json")
                            if let networkDevices = networkDevices {
                                DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                                    if(initScanning) {
                                        router.path.append(NavigationPathEnum.scanResultView(networkDevices: networkDevices))
                                    }
                                }
                            }
                        }
                } else {
                    LottieView(animation: .named("hc6 s"))
                }
                
                if let networkDevices = networkDevices {
                    HStack {
                        Text("\(initScanning ? networkDevices.count : 0)")
                            .textStyle(GlowFont(fontColor: .lightPurple))
                        Text("Devices Found...")
                            .foregroundStyle(.whiteForeground)
                            .fontWeight(.bold)
                    }
                }
                
                Button {
                    networkDevices = []
                    initScanning.toggle()
                } label: {
                    Text(initScanning ? "Stop" : "Scan current network" )
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(PurpuleRoundedBtnStyle())
                .padding()
            }
        }
    }
}


#Preview {
    NetworkScanView()
}
