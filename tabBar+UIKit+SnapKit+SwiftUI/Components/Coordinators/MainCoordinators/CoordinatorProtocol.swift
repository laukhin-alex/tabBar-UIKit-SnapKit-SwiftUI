//
//  CoordinatorProtocol.swift
//  tabBar+UIKit+SnapKit+SwiftUI
//
//  Created by Александр on 23.05.23.
//

import UIKit

// MARK: protocols for coordinator

protocol Coordinator {
    func start()
}

protocol Coordinating {
    var coordinator: Coordinator? { get set }
}
