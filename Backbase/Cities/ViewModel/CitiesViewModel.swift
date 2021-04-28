//
//  CitiesViewModel.swift
//  Backbase
//
//  Created by Shayan Mehranpoor on 4/26/21.
//

import Foundation

/*
 Since We are calling two api calls I used DispatchGroup to make sure both api are called and the data is ready.
 */

final class CitiesViewModel {
    
    var citiesService: CitiesServiceProtocol
    
    init(citiesService: CitiesServiceProtocol) {
        self.citiesService = citiesService
    }
        
    var cities: (([City]) -> Void)?
    var errorHandler: ((String) -> Void)?
    
    private var allCities: [City] = []
    
    func getCities() {
        
        citiesService.getCities { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let cities):
                self.allCities.append(contentsOf: cities)
                self.sort()
                self.cities?(self.allCities)
            case .failure(let error):
                self.errorHandler?(error.localizedDescription)
            }
        }
    }
    
    private func sort() {
        allCities.sort {
            $0.name ?? "" < $1.name ?? ""
        }
    }
}
