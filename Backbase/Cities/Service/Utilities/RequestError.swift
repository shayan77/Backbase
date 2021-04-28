//
//  RequestError.swift
//  Backbase
//
//  Created by Shayan Mehranpoor on 4/28/21.
//

import Foundation

enum RequestError: Error, LocalizedError {
    case jsonParseError
}

extension RequestError {
    public var errorDescription: String? {
        switch self {
        case .jsonParseError:
            return "JSON parsing problem, make sure response has a valid JSON"
        }
    }
}
