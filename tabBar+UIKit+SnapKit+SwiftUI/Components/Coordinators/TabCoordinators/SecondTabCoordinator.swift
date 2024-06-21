//
//  SecondTabCoordinator.swift
//  tabBar+UIKit+SnapKit+SwiftUI
//
//  Created by Александр on 24.05.23.
//

import UIKit
import SwiftUI
import OSLog

class SecondTabCoordinator: Coordinator {
    var viewController: MainViewController?
    var tabBarItem: CustomTabItem = .second

    func start() {
        let rootView = AnyView(RegularTextFields())
        let hostingController = UIHostingController(rootView: rootView)
        switchToController(hostingController)
        Logger.viewCycle.log("2 coordinator")
    }

    private func switchToController(_ controller: UIHostingController<AnyView>) {
        guard let viewController = viewController else { return }
        for child in viewController.children {
            if child != controller {
                child.view.removeFromSuperview()
                child.removeFromParent()
            }
        }
        viewController.add(controller)
        viewController.view.insertSubview(controller.view, at: 0)
        controller.view.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
            make.bottom.equalTo(viewController.viewModel?.tabBarCoordinator?.customTabBar.snp.top ?? 0)
        }
    }
}
