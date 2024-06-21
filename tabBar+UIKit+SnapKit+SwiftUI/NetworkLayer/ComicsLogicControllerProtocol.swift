//
//  ComicsLogicControllerProtocol.swift
//  tabBar+UIKit+SnapKit+SwiftUI
//
//  Created by Александр on 06.06.23.
//

import Combine
import Foundation

protocol ComicsLogicControllerProtocol: AnyObject {
    func getComics(limit: Int, offset: Int) -> AnyPublisher<ComicDataWrapper, Error>
}
