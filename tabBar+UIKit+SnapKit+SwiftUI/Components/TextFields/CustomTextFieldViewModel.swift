//
//  CustomTextFieldViewModel.swift
//  tabBar+UIKit+SnapKit+SwiftUI
//
//  Created by Александр on 16.05.23.
//

import Combine
import Foundation
import SwiftUI

class CustomTextFieldViewModel: ObservableObject {
    @Published var emailAddress = ""
    @Published var isValidEmailAddress = false
    @Published var signsCount = 0
    @Published var validationColor = Color.customLightDarkGray
    private var cancellableSet: Set<AnyCancellable> = []


    init() {
        // MARK: - checking validation pipeline
        $emailAddress
            .receive(on: RunLoop.main)
            .map { [unowned self] email in
                return self.isValidEmail(email)
            }
            .assign(to: \.isValidEmailAddress, on: self)
            .store(in: &cancellableSet)

        // MARK: - counting signs pipeline
        $emailAddress
            .receive(on: RunLoop.main)
            .map { data -> Int in
                return data.count
            }
            .assign(to: \.signsCount, on: self)
            .store(in: &cancellableSet)

        // MARK: - color pipeline
        $isValidEmailAddress
            .receive(on: RunLoop.main)
            .map  { email -> Color in
                if self.signsCount == 0 {
                    return Color.customLightDarkGray
                } else if self.signsCount > 0 && email {
                    return Color.customGreen
                } else {
                    return Color.customRed
                }
            }
            .assign(to: \.validationColor, on: self)
            .store(in: &cancellableSet)
    }

    // MARK: - validation function
    private func isValidEmail(_ email: String) -> Bool {
        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: email)
    }
}

