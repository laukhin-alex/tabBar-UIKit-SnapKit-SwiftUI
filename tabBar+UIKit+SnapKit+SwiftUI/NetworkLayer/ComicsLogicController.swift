//
//  ComicsLogicController.swift
//  tabBar+UIKit+SnapKit+SwiftUI
//
//  Created by Александр on 06.06.23.
//

import Combine
import Foundation

public final class ComicsLogicController: ComicsLogicControllerProtocol {

    public static let shared = ComicsLogicController()

    var networkController = NetworkController()
    
    func getComics(limit: Int, offset: Int) -> AnyPublisher<ComicDataWrapper, Error> {
        let endpoint = Endpoint.comics(limit: limit, offset: offset)
        return networkController.get(type: ComicDataWrapper.self, url: endpoint.url)
    }
}
