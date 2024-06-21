//
//  ApiErrorForAlert.swift
//  tabBar+UIKit+SnapKit+SwiftUI
//
//  Created by Александр on 30.05.23.
//

import Foundation

struct ApiErrorForAlert: Error, Identifiable {
    let id = UUID()
    var message = ""

    enum UrlResponseErrors: String, Error {
        case unknown = "Response wasn't recognized, try again later"
        case clientError = "Problem getting the information, try again later"
        case serverError = "Problem with the server, try again later"
        case otherError = "An error occurred, check you internet connection or try again later"
    }

    enum ApiStatusError: String {
        case limitGreaterThan100 = "Limit greater than 100."
        case limitInvalidOrBelow1 = "Limit invalid or below 1."
        case invalidOrUnrecognizedParameter = "Invalid or unrecognized parameter."
        case emptyParameter = "Empty parameter."
        case invalidOrUnrecognizedOrderingParameter = "Invalid or unrecognized ordering parameter."
        case tooManyValuesSentToMultiValueListFilter = "Too many values sent to a multi-value list filter."
        case invalidValuePassedToFilter = "Invalid value passed to filter."
        case missingAPIKey = "Missing API Key"
        case missingHash = "Missing Hash"
        case missingTimestamp = "Missing Timestamp"
        case invalidReferer = "Invalid Referer"
        case invalidHash = "Invalid Hash"
        case methodNotAllowed = "Method Not Allowed"
        case forbidden = "Forbidden"
        case unknown = "Unknown error"

        var description: String {
            switch self {
            case .limitGreaterThan100:
                return "The limit is greater than 100."
            case .limitInvalidOrBelow1:
                return "The limit is invalid or below 1."
            case .invalidOrUnrecognizedParameter:
                return "Invalid or unrecognized parameter."
            case .emptyParameter:
                return "Empty parameter."
            case .invalidOrUnrecognizedOrderingParameter:
                return "Invalid or unrecognized ordering parameter."
            case .tooManyValuesSentToMultiValueListFilter:
                return "Too many values sent to a multi-value list filter."
            case .invalidValuePassedToFilter:
                return "Invalid value passed to filter."
            case .missingAPIKey:
                return "Missing API Key."
            case .missingHash:
                return "Missing Hash."
            case .missingTimestamp:
                return "Missing Timestamp."
            case .invalidReferer:
                return "Invalid Referer."
            case .invalidHash:
                return "Invalid Hash."
            case .methodNotAllowed:
                return "Method Not Allowed."
            case .forbidden:
                return "Forbidden."
            case .unknown:
                return "An unknown error occurred."
            }
        }
    }

}
