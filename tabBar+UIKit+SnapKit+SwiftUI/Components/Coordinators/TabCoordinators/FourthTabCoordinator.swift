//
//  FourthTabCoordinator.swift
//  tabBar+UIKit+SnapKit+SwiftUI
//
//  Created by Александр on 24.05.23.
//

import UIKit
import SwiftUI

class FourthTabCoordinator: Coordinator {
    var navigationController: UINavigationController?
    var viewController: MainViewController?
    var tabBarItem: CustomTabItem = .fourth

    init() {
        navigationController = UINavigationController()
    }

    func start() {
            let rootView = AnyView(MarvelComicsView())
            let hostingController = UIHostingController(rootView: rootView)
//        hostingController.title = "Marvel comics"
            switchToController(navigationController ?? UINavigationController())
            navigationController?.setViewControllers([hostingController], animated: true) // MARK: - this is method from the UINavigationController. There is no back button
//            navigationController?.pushViewController(hostingController, animated: true) // MARK: - this is method from the UINavigationController. There is back button
            print("4 coordinator")
    }

    // MARK: - as we use in this tab navigation, this method is a little different from other coordinators: UINavigationController instead of UIViewController on the entrance
    private func switchToController(_ navigationController: UINavigationController) {
        guard let viewController = viewController else { return }
        for child in viewController.children {
            if child != navigationController {
                child.view.removeFromSuperview()
                child.removeFromParent()
            }
        }
        viewController.add(navigationController)
        viewController.view.insertSubview(navigationController.view, at: 0)
        navigationController.view.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
            make.bottom.equalTo(viewController.viewModel?.tabBarCoordinator?.customTabBar.snp.top ?? 0)
        }
    }
}
