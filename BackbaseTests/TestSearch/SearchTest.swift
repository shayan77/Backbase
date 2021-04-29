//
//  SearchTest.swift
//  BackbaseTests
//
//  Created by Shayan Mehranpoor on 4/29/21.
//

import XCTest
@testable import Backbase

final class SearchTest: XCTestCase {
    
    var sut: CitiesViewModel?
    var citis = [City(country: "UA", name: "Alabama", id: 0, coordinate: nil),
                 City(country: "IR", name: "Albuquerque", id: 0, coordinate: nil),
                 City(country: "AU", name: "Anaheim", id: 0, coordinate: nil),
                 City(country: "AE", name: "Arizona", id: 0, coordinate: nil),
                 City(country: "BR", name: "Alexandria", id: 0, coordinate: nil),
                 City(country: "AG", name: "Ahmedabad", id: 0, coordinate: nil),
                 City(country: "GR", name: "Beijing", id: 0, coordinate: nil),
                 City(country: "NG", name: "Bogota", id: 0, coordinate: nil),
                 City(country: "SR", name: "Shanghai", id: 0, coordinate: nil),
                 City(country: "SE", name: "Seoul", id: 0, coordinate: nil),
                 City(country: "AS", name: "Zibo", id: 0, coordinate: nil)
    ]
    
    override func tearDownWithError() throws {
        sut = nil
        try? super.tearDownWithError()
    }
    
    override func setUp() {
        sut = CitiesViewModel(citiesService: CitiesOfflineService.shared)
    }
    
    func test_Search() throws {
        // given
        guard let sut = sut else {
            throw UnitTestError()
        }
        
        // when
        sut.allCities = citis
        sut.searchCitiesWith("a", isSearchEmpty: false)
        
        // then
        XCTAssertEqual(sut.filterdCities.count, 6)
        let filterdCitis = [City(country: "UA", name: "Alabama", id: 0, coordinate: nil),
                            City(country: "IR", name: "Albuquerque", id: 0, coordinate: nil),
                            City(country: "AU", name: "Anaheim", id: 0, coordinate: nil),
                            City(country: "AE", name: "Arizona", id: 0, coordinate: nil),
                            City(country: "BR", name: "Alexandria", id: 0, coordinate: nil),
                            City(country: "AG", name: "Ahmedabad", id: 0, coordinate: nil)
        ]
        XCTAssertEqual(sut.filterdCities, filterdCitis)
    }
}

