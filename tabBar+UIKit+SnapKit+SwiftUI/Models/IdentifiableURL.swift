//
//  IdentifiableURL.swift
//  tabBar+UIKit+SnapKit+SwiftUI
//
//  Created by Александр on 31.05.23.
//

import Foundation

struct IdentifiableURL: Identifiable {
    let url: URL
    var id: String { url.absoluteString }
}
