//
//  MainCoordinator.swift
//  tabBar+UIKit+SnapKit+SwiftUI
//
//  Created by Александр on 23.05.23.
//

import UIKit
import OSLog

class MainCoordinator: Coordinator {
    var navigationController: UINavigationController?
    var tabCoordinator: TabBarCoordinator?
    
    init(tabCoordinator: TabBarCoordinator) {
        self.tabCoordinator = tabCoordinator
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - main start func
    func start() {
        Logger.viewCycle.log("main coordinator")
        let viewModel = MainViewModel(tabBarCoordinator: tabCoordinator ?? TabBarCoordinator())
        let viewController: UIViewController = MainViewController(viewModel: viewModel)
        viewModel.coordinator = self
        
        navigationController?.setViewControllers([viewController], animated: false)
    }
}
