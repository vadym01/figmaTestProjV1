//
//  NavigationPathEnum.swift
//  FigmaTestProj
//
//  Created by Vadym Vasylaki on 02.04.2024.
//

import Foundation
import SwiftUI

enum NavigationPathEnum: Hashable {
    case scanResultView(networkDevices: [NetworkDevice]?), networkScanView, deviceDetailsView(networkDevice: NetworkDevice), magneticDetection
    
    public var navigationView: some View {
        switch self {
        case .scanResultView(let networkDevices):
            return AnyView(ScanResultView(networkDevices: networkDevices)
                .navigationBarBackButtonHidden(true))
        case .networkScanView:
            return  AnyView(NetworkScanView()
                .navigationBarBackButtonHidden(true))
        case .deviceDetailsView(let networkDevice):
            return AnyView(DeviceDetailsView(networkDevice: networkDevice)
                .navigationBarBackButtonHidden(true))
        case .magneticDetection:
            return AnyView(MagneticDetection()
                .navigationBarBackButtonHidden(true))
        }
    }
}
