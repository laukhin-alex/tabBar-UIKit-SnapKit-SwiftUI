//
//  TabBarButton.swift
//  tabBar+UIKit+SnapKit+SwiftUI
//
//  Created by Александр on 15.05.23.
//
import SnapKit
import UIKit

class TabBarButton: UIButton {
    var item: CustomTabItem

    var label: UILabel
    var tabIconView: UIImageView

    init(item: CustomTabItem) {
        self.item = item
        self.label = UILabel()
        self.tabIconView = UIImageView()

        super.init(frame: .zero)

        label.text = item.title
        label.font = UIFont.systemFont(ofSize: 15)
        label.textAlignment = .center
        label.numberOfLines = 0
        self.addSubview(label)

        tabIconView.image = item.icon
        tabIconView.contentMode = .scaleAspectFit
        self.addSubview(tabIconView)

        tabIconView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(10) // add an offset to push down the icon
            make.height.width.equalTo(20)
        }

        label.snp.makeConstraints { make in
            make.top.equalTo(tabIconView.snp.bottom).offset(5)
            make.centerX.equalToSuperview()
        }

        //MARK: - Set the initial colors for the button
        setSelected(false)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
// MARK: - color for tabs
    func setSelected(_ selected: Bool) {
        label.textColor = selected ? .blue : .lightGray
        tabIconView.tintColor = selected ? .blue : .lightGray
        tabIconView.image = selected ? item.selectedIcon : item.icon

    }
}
