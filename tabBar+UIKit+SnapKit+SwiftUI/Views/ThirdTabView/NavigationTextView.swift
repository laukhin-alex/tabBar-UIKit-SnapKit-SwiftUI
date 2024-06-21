//
//  NavigationTextView.swift
//  tabBar+UIKit+SnapKit+SwiftUI
//
//  Created by Александр on 24.05.23.
//

import SwiftUI

struct NavigationTextView: View {
    var onSubmit: (String) -> Void // MARK: output closure
    @State var text = ""

    var body: some View {
        VStack(spacing: 50) {
            CustomTextField(onTextChanged: { newText in
                text = newText
            },
                            placeholder: "Введите почту",
                            textForegroundColor: .customLightDarkGray,
                            textFieldBackGroundColor: .white)
            SolidButton(action: {
                onSubmit(text)
            },
                        title: "Дальше",
                        disabled: false,
                        font: .headline,
                        frameMaxWidth: .infinity,
                        foregroundColor: .customLinearGradientLightGray)
        }
        .padding()
    }
}

struct NavigationTextView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationTextView { text in

        }
    }
}
