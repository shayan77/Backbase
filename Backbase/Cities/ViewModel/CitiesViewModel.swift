//
//  CitiesViewModel.swift
//  Backbase
//
//  Created by Shayan Mehranpoor on 4/26/21.
//

import Foundation

/*
Here I get list of cities from the CitiesService.
*/

final class CitiesViewModel {
    
    var citiesService: CitiesServiceProtocol
    
    init(citiesService: CitiesServiceProtocol) {
        self.citiesService = citiesService
    }
        
    var cities: (([City]) -> Void)?
    var errorHandler: ((String) -> Void)?
    
    var loading: ((Bool) -> Void)?
    
    private var allCities: [City] = []
    private var filterdCities: [City] = []
    
    func getCities() {
        self.loading?(true)
        citiesService.getCities { [weak self] result in
            guard let self = self else { return }
            self.loading?(false)
            switch result {
            case .success(let cities):
                self.allCities.append(contentsOf: cities)
                self.sortedCities()
                self.cities?(self.allCities)
            case .failure(let error):
                self.errorHandler?(error.localizedDescription)
            }
        }
    }
    
    func searchCitiesWith(_ param: String, isSearchEmpty: Bool) {
        if isSearchEmpty {
            self.cities?(self.allCities)
        } else {
            filterdCities = allCities.filter { (city: City) -> Bool in
                return (city.name ?? "").lowercased().hasPrefix(param.lowercased())
            }
            self.cities?(filterdCities)
        }
    }
    
    private func sortedCities() {
        allCities.sort {
            $0.name ?? "" < $1.name ?? ""
        }
    }
}
