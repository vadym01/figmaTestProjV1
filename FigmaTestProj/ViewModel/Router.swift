//
//  Router.swift
//  FigmaTestProj
//
//  Created by Vadym Vasylaki on 01.04.2024.
//

import Foundation
import SwiftUI

class Router: ObservableObject {
    @Published var path = NavigationPath()
    func reset() {
        path = NavigationPath()
    }
}
