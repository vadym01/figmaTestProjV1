//
//  MainScreenMuttonsView.swift
//  FigmaTestProj
//
//  Created by Vadym Vasylaki on 02.04.2024.
//

import Foundation
import SwiftUI

enum MainScreenButtonsEnum: String, CaseIterable, Hashable {
    case infrared, bluetooth, magnetic, antispy
    
    var btnIcon: Image {
        switch self {
        case .infrared:
            Image("Infrared")
        case .bluetooth:
            Image("Bluetooth")
        case .magnetic:
            Image("Magnetic")
        case .antispy:
            Image( "Antispy")
        }
    }
    
    var btnDescription: String {
        switch self {
        case .infrared:
            "Infrared \nDetection"
        case .bluetooth:
            "Bluetooth \nDetection"
        case .magnetic:
            "Magnetic \nDetection"
        case .antispy:
            "Antispy \nTips"
        }
    }
    
    func navigationAction(router: Router) {
        switch self {
        case .infrared, .bluetooth, .antispy:
            break
        case .magnetic:
            router.path.append(NavigationPathEnum.magneticDetection)
        }
    }
}
