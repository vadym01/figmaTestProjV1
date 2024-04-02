//
//  NetworkDevices.swift
//  FigmaTestProj
//
//  Created by Vadym Vasylaki on 01.04.2024.
//

import Foundation

struct NetworkDevice: Decodable, Hashable {
    var networkName: String?
    var connectionType: String
    var ipAddress: String
    var isAvailable: Bool
    var MACAddress: String?
    var hostName: String
}
