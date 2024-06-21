//
//  MainViewController.swift
//  tabBar+UIKit+SnapKit+SwiftUI
//
//  Created by Александр on 15.05.23.
//

import UIKit
import SwiftUI

class MainViewController: UIViewController {
    var viewModel: MainViewModel?

    init(viewModel: MainViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let customTabBar = viewModel?.tabBarCoordinator?.customTabBar
        self.view.backgroundColor = .white
        self.view.addSubview(customTabBar ?? UIView())


        // MARK: - SnapKit constraints
        customTabBar?.snp.makeConstraints { make in
            make.left.right.bottom.equalToSuperview()
            make.height.equalTo(80)
        }

        // MARK: - activating tabBarCoordinator
        viewModel?.tabBarCoordinator?.viewController = self
        viewModel?.activateTabBarCoordinator()
    }

    func add(_ child: UIViewController) {
        addChild(child)
        view.insertSubview(child.view, at: 0)
        child.didMove(toParent: self)
    }
}
