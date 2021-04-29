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
        // Get cities in background thread
        DispatchQueue.global(qos: .default).async {
            let bundle = Bundle(for: type(of: self))
            if let path = bundle.path(forResource: "cities", ofType: "json") {
                do {
                    let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                    guard let cities = try? JSONDecoder().decode([City].self, from: data) else {
                        completionHandler(.failure(.jsonParseError))
                        return
                    }
                    // Taking Data to main thread so we can update UI.
                    DispatchQueue.main.async {
                        completionHandler(.success(cities))
                    }
                } catch {
                    assertionFailure("File did not found")
                }
            }
        }
    }
}
