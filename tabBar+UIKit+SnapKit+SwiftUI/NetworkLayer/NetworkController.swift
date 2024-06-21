//
//  NetworkController.swift
//  tabBar+UIKit+SnapKit+SwiftUI
//
//  Created by Александр on 06.06.23.
//

import Combine
import Foundation

public final class NetworkController: NetworkControllerProtocol {

    func get<T>(type: T.Type, url: URL) -> AnyPublisher<T, Error> where T : Decodable {
        let urlRequest = URLRequest(url: url)

        return URLSession.shared.dataTaskPublisher(for: urlRequest)
            .tryMap({ (data: Data, response: URLResponse) in // MARK: responses in common
                guard let httpResponse = response as? HTTPURLResponse else {
                    throw ApiErrorForAlert.UrlResponseErrors.unknown
                }
                let clientErrors = [400, 402, 404] + Array(406...408) + Array(410...499)
                if clientErrors.contains(httpResponse.statusCode) {
                    throw ApiErrorForAlert.UrlResponseErrors.clientError
                }
                if (500...599).contains(httpResponse.statusCode) {
                    throw ApiErrorForAlert.UrlResponseErrors.serverError
                }
                return data
            })
            .decode(type: T.self, decoder: JSONDecoder())
            .mapError({ error -> ApiErrorForAlert.UrlResponseErrors in // MARK: other errors mapping after decoding
                if let responseError = error as? ApiErrorForAlert.UrlResponseErrors {
                    return responseError
                } else {
                    return ApiErrorForAlert.UrlResponseErrors.otherError
                }
            })
            .eraseToAnyPublisher()
    }
}
