//
//  CitiesOfflineService.swift
//  Backbase
//
//  Created by Shayan Mehranpoor on 4/26/21.
//

import Foundation

final class CitiesOfflineService: CitiesServiceProtocol {
    
    static let shared = CitiesOfflineService()
    
    func getCities(completionHandler: @escaping CitiesCompletionHandler) {
        let bundle = Bundle(for: type(of: self))
        if let path = bundle.path(forResource: "cities", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                guard let cities = try? JSONDecoder().decode([City].self, from: data) else {
                    completionHandler(.failure(.jsonParseError))
                    return
                }
                completionHandler(.success(cities))
            } catch {
                assertionFailure("File did not found")
            }
        }
    }
}
