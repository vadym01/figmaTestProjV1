//
//  NetworkScanerVM.swift
//  FigmaTestProj
//
//  Created by Vadym Vasylaki on 01.04.2024.
//

import Foundation

struct NetworkScanerVM {
    
    func loadJsonData(from fileName: String) -> [NetworkDevice] {
        let data: Data
        
        guard let file = Bundle.main.url(forResource: fileName, withExtension: nil) else {
            fatalError("Couldn't find \(fileName) in main moundle")
        }
        
        do {
            data = try Data(contentsOf: file)
        } catch {
            fatalError("Couldn't load \(fileName) from main bundle with error\(error)")
        }
        
        do {
            let decoder = JSONDecoder()
            return try decoder.decode([NetworkDevice].self, from: data)
        } catch {
            fatalError("Couldn't parse \(fileName). \n error: \(error)")
        }
    }
}

extension NetworkScanerVM {
    static var mocData: [NetworkDevice] = [
    NetworkDevice(networkName: nil, connectionType: "Wifi", ipAddress: "192.168.101", isAvailable: false, MACAddress: "00-B0-D0-25-C2-46", hostName: "ijpc-4571234.local"),
    NetworkDevice(networkName: "Ms_12k", connectionType: "Wifi", ipAddress: "192.168.111", isAvailable: true, MACAddress: "00-B4-D0-25-C2-46", hostName: "i2pc-4571234.local")
    ]
}
