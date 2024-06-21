//
//  EndPoint.swift
//  tabBar+UIKit+SnapKit+SwiftUI
//
//  Created by Александр on 06.06.23.
//

import Foundation
import CryptoKit

struct Endpoint {
    let path: String
    let queryItems: [URLQueryItem]
}

extension Endpoint {
    var url: URL {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "gateway.marvel.com"
        components.path = path
        components.queryItems = queryItems

        guard let url = components.url else {
            preconditionFailure("Invalid URL components: \(components)")
        }

        return url
    }
}

extension Endpoint {
    static func comics(limit: Int, offset: Int) -> Endpoint {
        let publicKey = "1c53c52a0ce0fbcad36742a856a899fa"
        let privateKey = "f1cfd33a80c387def218807662276920db4428cd"
        let ts = String(Date().timeIntervalSince1970)
        let hash = MD5(string: "\(ts)\(privateKey)\(publicKey)")

        return Endpoint(
            path: "/v1/public/comics",
            queryItems: [
                URLQueryItem(name: "limit", value: String(limit)),
                URLQueryItem(name: "offset", value: String(offset)),
                URLQueryItem(name: "ts", value: ts),
                URLQueryItem(name: "apikey", value: publicKey),
                URLQueryItem(name: "hash", value: hash)
            ]
        )
    }

    private static func MD5(string: String) -> String {
        let digest = Insecure.MD5.hash(data: string.data(using: .utf8) ?? Data())
        return digest.map { String(format: "%02hhx", $0) }.joined()
    }
}
