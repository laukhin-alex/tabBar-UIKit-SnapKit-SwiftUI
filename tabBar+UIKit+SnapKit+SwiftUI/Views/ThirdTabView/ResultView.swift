//
//  ResultView.swift
//  tabBar+UIKit+SnapKit+SwiftUI
//
//  Created by Александр on 24.05.23.
//

import SwiftUI

struct ResultView: View {
    var text: String
    var onHome: () -> Void // MARK: this closure is for coordinator recognizing typing home button

    var body: some View {
        VStack(spacing: 50) {
            Text(text)
                .padding()
                .font(.largeTitle)
                .foregroundColor(.blue)
                .frame(maxWidth: .infinity)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.customGreen, lineWidth: 5)
                )
                .padding()
            LinearGradientButton(action: onHome,
                                 title: "Начать с начала?",
                                 disabled: false,
                                 font: .title,
                                 frameMaxWidth: .infinity,
                                 foregroundColor: .blue,
                                 gradientColors: [
                                    .green,
                                    .blue
                                 ],
                                 startPoint: .top,
                                 endPoint: .bottom)
        }
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView(text: "Text") {
        }
    }
}
