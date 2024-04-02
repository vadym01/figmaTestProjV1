//
//  FigmaTestProjApp.swift
//  FigmaTestProj
//
//  Created by Vadym Vasylaki on 01.04.2024.
//

import SwiftUI

@main
struct FigmaTestProjApp: App {
    
    @StateObject var router = Router()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(router)
        }
    }
}
