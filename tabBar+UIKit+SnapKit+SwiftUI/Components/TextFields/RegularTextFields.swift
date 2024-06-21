//
//  RegularTextFields.swift
//  tabBar+UIKit+SnapKit+SwiftUI
//
//  Created by Александр on 16.05.23.
//

import SwiftUI

struct RegularTextFields: View {
    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all) // MARK: iOS 13
            VStack(spacing: 40) {
                CustomTextField(onTextChanged: {_ in },
                                placeholder: "Placeholder",
                                textForegroundColor: Color.customLightDarkGray,
                                textFieldBackGroundColor: Color.customDarkGray)
                CustomTextField(onTextChanged: {_ in },
                                placeholder: "Placeholder",
                                textForegroundColor: Color.customLightDarkGray,
                                textFieldBackGroundColor: Color.customDarkGray)
                CustomTextField(onTextChanged: {_ in },
                                placeholder: "Placeholder",
                                textForegroundColor: Color.customLightDarkGray,
                                textFieldBackGroundColor: Color.customDarkGray)
            }
        }
    }
}

struct CustomTextField: View {
    @ObservedObject private var customTextFieldViewModel = CustomTextFieldViewModel()
    var onTextChanged: (String) -> Void
    var placeholder: String
    var textForegroundColor: Color
    var textFieldBackGroundColor:Color


    var body: some View {
        VStack {
            HStack {
                Text("Label")
                    .foregroundColor(textForegroundColor)
                    .font(.headline)
                Spacer()
            }
            .padding(.horizontal)
            // MARK: - here is the way to make a custom placeholder
            ZStack(alignment: .leading) {
                if customTextFieldViewModel.signsCount == 0 {
                    Text(placeholder)
                }
                TextField("", text: Binding(
                    get: {
                    self.customTextFieldViewModel.emailAddress
                },
                    set: { (newText) in
                    self.customTextFieldViewModel.emailAddress = newText
                    self.onTextChanged(newText)
                }))
            }
            .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 10))
            .foregroundColor(textForegroundColor)
            .background(RoundedRectangle(cornerRadius: 10)
                .foregroundColor(textFieldBackGroundColor))
            .overlay(
                // MARK: - border
                RoundedRectangle(cornerRadius: 8)
                    .stroke(customTextFieldViewModel.validationColor, lineWidth: 2)
            )
            .font(.headline)
            .padding()
            HStack {
                HStack {
                    Image(systemName: "info.circle.fill")
                    Text("Hint text")
                        .font(.headline)
                }
                .foregroundColor(customTextFieldViewModel.validationColor)
                Spacer()
            }
            .padding(.horizontal)
        }
    }
}

struct RegularTextFields_Previews: PreviewProvider {
    static var previews: some View {
        RegularTextFields()
    }
}
