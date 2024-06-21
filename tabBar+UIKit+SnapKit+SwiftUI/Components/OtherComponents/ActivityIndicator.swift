//
//  ActivityIndicator.swift
//  tabBar+UIKit+SnapKit+SwiftUI
//
//  Created by Александр on 31.05.23.
//

import SwiftUI

struct ActivityIndicator: UIViewRepresentable {
    @Binding var isAnimating: Bool

    func makeUIView(context: UIViewRepresentableContext<ActivityIndicator>) -> UIActivityIndicatorView {
        let indicator = UIActivityIndicatorView(style: .large)
        return indicator
    }

    func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<ActivityIndicator>) {
        isAnimating ? uiView.startAnimating() : uiView.stopAnimating()
    }
}
