//
//  AppCoordinatorTests.swift
//  BackbaseTests
//
//  Created by Shayan Mehranpoor on 4/29/21.
//

import XCTest
@testable import Backbase


final class AppCoordinatorTests: XCTestCase {

    var sut: AppCoordinator?
    var window: UIWindow?
    
    override func tearDownWithError() throws {
        sut = nil
        window = nil
        try? super.tearDownWithError()
    }
    
    override func setUp() {
        let nav = UINavigationController()
        window = UIWindow(frame: UIScreen.main.bounds)
        sut = AppCoordinator(navigationController: nav, window: window)
    }
    
    override func tearDown() {
        sut = nil
        window = nil
    }
    
    func test_start() throws {
        // given
        guard let sut = sut else {
            throw UnitTestError()
        }
        
        // when
        sut.start(animated: false)
        
        
        // then
        XCTAssertEqual(sut.navigationController.viewControllers.count, 1)
        let rootVC = sut.navigationController.viewControllers[0] as? CitiesViewController
        XCTAssertNotNil(rootVC, "Check if root vsc is CitiesViewController")
    }
    
    func test_ToProducts() throws {
        // given
        guard let sut = sut else {
            throw UnitTestError()
        }
        // when
        sut.navigateToMap(City(country: "IR", name: "Tehran", id: 1, coordinate: Coordinate(longitude: 0.0, latitude: 0.0)))
        
        // then
        XCTAssertEqual(sut.navigationController.viewControllers.count, 1)
        let visibleVC = sut.navigationController.visibleViewController as? MapViewController
        XCTAssertNotNil(visibleVC, "Check if presented vc is MapViewController")
    }
}
