//
//  LoggerExtension.swift
//  tabBar+UIKit+SnapKit+SwiftUI
//
//  Created by Александр Лаухин on 21.06.2024.
//

import Foundation
import OSLog

extension Logger {
    private static var subSystem = Bundle.main.bundleIdentifier ?? "DefaultSubSystem"
    static let viewCycle = Logger(subsystem: subSystem, category: "viewCycle")
}
