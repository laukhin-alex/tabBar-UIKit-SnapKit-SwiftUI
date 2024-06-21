//
//  MainViewModel.swift
//  tabBar+UIKit+SnapKit+SwiftUI
//
//  Created by Александр on 05.06.23.
//

import Foundation

class MainViewModel: Coordinating {
    var coordinator: Coordinator?
    var tabBarCoordinator: TabBarCoordinator?

    init(tabBarCoordinator: TabBarCoordinator) {
        self.tabBarCoordinator = tabBarCoordinator
    }

    func activateTabBarCoordinator() {
        tabBarCoordinator?.start()
    }
}
