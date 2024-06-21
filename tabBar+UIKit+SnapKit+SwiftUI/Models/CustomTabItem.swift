//
//  CustomTabItem.swift
//  tabBar+UIKit+SnapKit+SwiftUI
//
//  Created by Александр on 15.05.23.
//

import UIKit
import SwiftUI

// MARK: These are settings for our tabBar
struct TabItem {
    var icon: String
    var selectedIcon: String
    var title: String
}
enum CustomTabItem: String, CaseIterable {
    // MARK: - Quantity of our tabItems
    case first
    case second
    case third
    case fourth

    // MARK: - settings for tabItems - 1st is icon, 2nd is chosen icon, 3d is title
    static var firstItem  = ["house", "house.fill", "Home"]
    static var secondItem = ["magnifyingglass", "magnifyingglass.circle.fill", "Search"]
    static var thirdItem  = ["book", "book.fill", "Result"]
    static var fourthItem = ["books.vertical", "books.vertical.fill", "Marvel"]

// MARK: - icon
    var icon: UIImage? {
        switch self {
        case .first:
            return UIImage(systemName: CustomTabItem.firstItem[0])
        case .second:
            return UIImage(systemName: CustomTabItem.secondItem[0])
        case .third:
            return UIImage(systemName: CustomTabItem.thirdItem[0])
        case .fourth:
            return UIImage(systemName: CustomTabItem.fourthItem[0])
        }
    }

    // MARK: - chosen tab icon
    var selectedIcon: UIImage? {
        switch self {
        case .first:
            return UIImage(systemName: CustomTabItem.firstItem[1])
        case .second:
            return UIImage(systemName: CustomTabItem.secondItem[1])
        case .third:
            return UIImage(systemName: CustomTabItem.thirdItem[1])
        case .fourth:
            return UIImage(systemName: CustomTabItem.fourthItem[1])
        }
    }

    // MARK: - tab title
    var title: String {
        switch self {
        case .first:
            return CustomTabItem.firstItem[2]
        case .second:
            return CustomTabItem.secondItem[2]
        case .third:
            return CustomTabItem.thirdItem[2]
        case .fourth:
            return CustomTabItem.fourthItem[2]
        }
    }
}
