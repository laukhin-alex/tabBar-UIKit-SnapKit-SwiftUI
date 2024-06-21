//
//  ThirdTabCoordinator.swift
//  tabBar+UIKit+SnapKit+SwiftUI
//
//  Created by Александр on 24.05.23.
//

import UIKit
import SwiftUI
import OSLog

class ThirdTabCoordinator: Coordinator {
    var navigationController: UINavigationController?
    var viewController: MainViewController?
    var tabBarItem: CustomTabItem = .third
    var counter: Int = 0
    var text: String = ""

    init() {
        navigationController = UINavigationController()
    }

    func start() {
        if counter == 3 {
            let rootView = AnyView(ResultView(text: text, onHome: {
                // MARK: - zeroing properties
                self.counter = 0
                self.text = ""
                self.start() // MARK: without start nothing will work
            }))
            let hostingController = UIHostingController(rootView: rootView)
            switchToController(navigationController ?? UINavigationController())
            navigationController?.setViewControllers([hostingController], animated: true) // MARK: - this is method from the UINavigationController. There is no back button
//            navigationController?.pushViewController(hostingController, animated: true) // MARK: - this is method from the UINavigationController. There is back button
            Logger.viewCycle.log("3 back to home coordinator")
        } else {
            let rootView = AnyView(NavigationTextView(onSubmit: { inputText in
                // MARK: counter and text
                if self.counter == 0 {
                    self.text = inputText
                } else {
                    self.text += "\n" + inputText
                }
                self.counter += 1
                self.start()
            }))
            let hostingController = UIHostingController(rootView: rootView)
            switchToController(navigationController ?? UINavigationController())
            navigationController?.setViewControllers([hostingController], animated: true)
//            navigationController?.pushViewController(hostingController, animated: true)
            Logger.viewCycle.info("3 count \(self.counter + 1) coordinator")
        }
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
