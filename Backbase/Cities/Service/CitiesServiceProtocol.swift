//
//  CitiesServiceProtocol.swift
//  Backbase
//
//  Created by Shayan Mehranpoor on 4/26/21.
//

import Foundation

typealias CitiesCompletionHandler = (Result<[City], RequestError>) -> Void

protocol CitiesServiceProtocol {
    func getCities(completionHandler: @escaping CitiesCompletionHandler)
}
