//
//  FirstTabCoordinator.swift
//  tabBar+UIKit+SnapKit+SwiftUI
//
//  Created by Александр on 24.05.23.
//

import UIKit
import SwiftUI

class FirstTabCoordinator: Coordinator {
    var viewController: MainViewController?
    var tabBarItem: CustomTabItem = .first

    // MARK: - start func for 1 tab it's simple
    func start() {
        let rootView = AnyView(RegularButtons())
        let hostingController = UIHostingController(rootView: rootView)
        switchToController(hostingController)
        print("1 coordinator")
    }

    // MARK: - before injection of the Coordinator patter this func was in the mainViewController
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

