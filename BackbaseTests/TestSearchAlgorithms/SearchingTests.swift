//
//  SearchingTests.swift
//  BackbaseTests
//
//  Created by Shayan Mehranpoor on 4/29/21.
//

import XCTest
@testable import Backbase

class SearchingTests: XCTestCase {
    
    var cities: [City] = []
    var sortedArray: [City] = []
    
    override func setUp() {
        let bundle = Bundle(for: type(of: self))
        if let path = bundle.path(forResource: "cities", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                guard let cities = try? JSONDecoder().decode([City].self, from: data) else {
                    print("Parsing error")
                    return
                }
                self.cities = cities
                self.sortedArray = cities.sorted { $0.name ?? "" < $1.name ?? "" }
            } catch {
                assertionFailure("File did not found")
            }
        }
    }
    
    func testKnuthMorrisPratt_StringArray() {
        let originalFilterdArray = cities.filter { (city: City) -> Bool in
            return (city.name ?? "").lowercased().hasPrefix("al".lowercased())
        }
        let sortedArray = cities.sorted { $0.name ?? "" < $1.name ?? "" }
        let filterdArray = sortedArray.filter { (city: City) -> Bool in
            return (city.name ?? "").lowercased().hasPrefix("al".lowercased())
        }
        XCTAssertEqual(originalFilterdArray, filterdArray)
    }
    
    func testPerformance() {
        runMeasureTest()
    }
    
    private func runMeasureTest() {
        
        print("Running search performance tests for cities")
        
        // Unsorted array Search
        var stopwatch = Stopwatch()
        _ = cities.filter { (city: City) -> Bool in
            return (city.name ?? "").lowercased().hasPrefix("al".lowercased())
        }
        print("=============================================")
        print("Unsorted array Search")
        stopwatch.printElapsedTime()
        
        
        // Sorted Array Search
        stopwatch = Stopwatch()
        _ = sortedArray.filter { (city: City) -> Bool in
            return (city.name ?? "").lowercased().hasPrefix("al".lowercased())
        }
        print("=============================================")
        print("Sorted Array Search")
        stopwatch.printElapsedTime()
    }
}

private class Stopwatch {
    private var date = Date()
    var elapsedTime: TimeInterval {
        return NSDate().timeIntervalSince(date)
    }
    
    func printElapsedTime() {
        print("Elapsed Time (seconds): ", elapsedTime)
    }
}
