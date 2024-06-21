//
//  TabBarCoordinator.swift
//  tabBar+UIKit+SnapKit+SwiftUI
//
//  Created by Александр on 23.05.23.
//

import SwiftUI
import UIKit
import SnapKit

class TabBarCoordinator: Coordinator {
    var viewController: MainViewController?

    // MARK: - Array with Custom Tab Items
    let tabBarItems: [CustomTabItem] = [.first, .second, .third, .fourth]

    // MARK: - CustomTabBar with Custom Tab Items
    lazy var customTabBar = CustomTabBar(items: tabBarItems)

    // MARK: - Dict with coordinators
    lazy var coordinators: [CustomTabItem: Coordinator] = {
        var coordinators = [CustomTabItem: Coordinator]()
        for item in tabBarItems {
            let coordinator: Coordinator
            switch item {
            case .first:
                let firstCoordinator = FirstTabCoordinator()
                firstCoordinator.viewController = self.viewController
                coordinator = firstCoordinator
            case .second:
                let secondCoordinator = SecondTabCoordinator()
                secondCoordinator.viewController = self.viewController
                coordinator = secondCoordinator
            case .third:
                let thirdCoordinator = ThirdTabCoordinator()
                thirdCoordinator.viewController = self.viewController
                coordinator = thirdCoordinator
            case .fourth:
                let fourthCoordinator = FourthTabCoordinator()
                fourthCoordinator.viewController = self.viewController
                coordinator = fourthCoordinator
            }
            coordinators[item] = coordinator
        }
        return coordinators
    }()

    // MARK: - start func for the tabbar coordinator
    func start() {
        print("tab coordinator")
        // MARK: - choosing a tab
        customTabBar.onTabSelected = { [weak self] index in
            self?.tabTapped((self?.customTabBar.buttons[index]) ?? UIButton())
        }
        if let firstCoordinator = coordinators[.first] {
            firstCoordinator.start()
        }
        // MARK: - first hosting controller is chosen automatically
        customTabBar.buttons.first?.setSelected(true)
    }

    // MARK: - func choosing a tab
    @objc func tabTapped(_ sender: UIButton) {
        let selectedItem = tabBarItems[sender.tag]
        for button in customTabBar.buttons {
            let isSelected = (button == sender)
            button.setSelected(isSelected)
        }
        print(selectedItem)
        coordinators[selectedItem]?.start()
    }
}
