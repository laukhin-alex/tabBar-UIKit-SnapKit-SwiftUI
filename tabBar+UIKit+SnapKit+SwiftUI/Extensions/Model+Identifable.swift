//
//  Model+Identifable.swift
//  tabBar+UIKit+SnapKit+SwiftUI
//
//  Created by Александр on 29.05.23.
//

import Foundation

extension ComicDataWrapper: Identifiable {
    public var id: String { data?.count?.description ?? "" }
}
