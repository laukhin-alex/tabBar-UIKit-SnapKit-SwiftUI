//
//  NetworkControllerProtocol.swift
//  tabBar+UIKit+SnapKit+SwiftUI
//
//  Created by Александр on 06.06.23.
//

import Combine
import Foundation

protocol NetworkControllerProtocol: AnyObject {
    func get<T>(type: T.Type,
                url: URL) -> AnyPublisher<T, Error> where T: Decodable
}
