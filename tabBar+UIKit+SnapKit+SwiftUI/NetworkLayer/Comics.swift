//
//  Comics.swift
//  tabBar+UIKit+SnapKit+SwiftUI
//
//  Created by Александр on 27.05.23.
//

import Foundation

struct ComicDataWrapper: Codable, CustomStringConvertible {
    let code: Int?
    let status: String?
    let data: ComicDataContainer?
}

struct ComicDataContainer: Codable, CustomStringConvertible {
    let offset: Int?
    let limit: Int?
    let total: Int?
    let count: Int?
    let results: [Comic]?
}

struct Comic: Codable, Identifiable, CustomStringConvertible {
    let id: Int?
    let title: String?
    let pageCount: Int?
    let thumbnail: Thumbnail?
    let variantDescription: String?
    let description: String?
    let images: [Thumbnail]?
}

struct Thumbnail: Codable, CustomStringConvertible {
    let path: String?
    let ext: String?

    enum CodingKeys: String, CodingKey {
        case path
        case ext = "extension"
    }

    var url: URL? {
        guard let path = path, let ext = ext else {
            return nil
        }
        var urlStr = "\(path).\(ext)"
        urlStr = urlStr.replacingOccurrences(of: "http://", with: "https://")
        return URL(string: urlStr)
    }
}

extension Thumbnail: Hashable {
    static func == (lhs: Thumbnail, rhs: Thumbnail) -> Bool {
        return lhs.path == rhs.path && lhs.ext == rhs.ext
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(path)
        hasher.combine(ext)
    }
}

extension CustomStringConvertible where Self: Codable {
    var description: String {
        var description = "\n \(type(of: self)) \n"
        let selfMirror = Mirror(reflecting: self)
        for child in selfMirror.children {
            if let propertyName = child.label {
                description += "\(propertyName): \(child.value)\n"
            }
        }
        return description
    }
}
