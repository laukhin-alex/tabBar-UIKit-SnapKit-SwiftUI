//
//  CustomTabBar.swift
//  tabBar+UIKit+SnapKit+SwiftUI
//
//  Created by Александр on 15.05.23.
//

import UIKit
import SnapKit

class CustomTabBar: UIView {
    // MARK: - array with tab buttons
    var buttons: [TabBarButton] = []
    var onTabSelected: ((Int) -> Void)?
    
    init(items: [CustomTabItem]) {
        super.init(frame: .zero)
        // MARK: - background color settings
        self.backgroundColor = UIColor.white
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.2
        self.layer.shadowOffset = CGSize(width: 0, height: -1)
        self.layer.shadowRadius = 4
        buttons = items.map { TabBarButton(item: $0) }
        for (index, button) in buttons.enumerated() {
            button.addTarget(self, action: #selector(tabTapped(_:)), for: .touchUpInside)
            button.tag = index
        }
        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
// MARK: - stack with tabsItems
    private func setupViews() {
        let stackView = UIStackView(arrangedSubviews: buttons)
        stackView.distribution = .fillEqually
        stackView.axis = .horizontal
        self.addSubview(stackView)

        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    @objc func tabTapped(_ sender: TabBarButton) {
        buttons.forEach { $0.setSelected($0 == sender) }
        onTabSelected?(sender.tag)
    }
}
