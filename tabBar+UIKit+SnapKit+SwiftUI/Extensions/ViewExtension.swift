//
//  ViewExtension.swift
//  tabBar+UIKit+SnapKit+SwiftUI
//
//  Created by Александр on 18.05.23.
//

import SwiftUI

extension View {
    func buttonCommonStyle(font: Font, frameMaxWidth: CGFloat, foregroundColor: Color) -> some View {
        self
            .padding()
            .font(font)
            .frame(maxWidth: frameMaxWidth)
            .foregroundColor(foregroundColor)
    }
}
