//
//  Collection+indecis.swift
//  tabBar+UIKit+SnapKit+SwiftUI
//
//  Created by Александр on 29.05.23.
//

import Foundation
import SwiftUI


extension RandomAccessCollection where Self.Element: Identifiable {
    func isLast<Item: Identifiable>(_ elem: Item) -> Bool {
        guard let itemIndex = self.firstIndex(where: { AnyHashable($0.id) == AnyHashable(elem.id)}) else {
            return false
        }
        return distance(from: itemIndex, to: self.endIndex) == 1
    }
    
    func isNearEnd<Item: Identifiable>(_ elem: Item, offset: Int = 5) -> Bool {
        guard let itemIndex = self.firstIndex(where: { AnyHashable($0.id) == AnyHashable(elem.id)}) else {
            return false
        }
        let distance = self.distance(from: itemIndex, to: self.endIndex)
        return distance <= offset
    }
}
