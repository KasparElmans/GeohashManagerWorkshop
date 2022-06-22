//
//  GeohashManagerWorkshopTests.swift
//  GeohashManagerWorkshopTests
//
//  Created by Kaspar Elmans on 21/06/2022.
//

import XCTest
@testable import GeohashManagerWorkshop
import CoreLocation

class GeohashManagerTests: XCTestCase {

    func test_geohashManager_onInitGeohash5IsNil() {
        let sut = createSUT()
        XCTAssertEqual(sut.geohash5, nil)
    }
    
    func test_geohash5_isSetWhenReceivingALocation() {
        let sut = createSUT()
        sut.updateLocation(CLLocation.stub)
        XCTAssertEqual(sut.geohash5, "u31nz")
    }
    
    func test_geohash5_isResetToNilWhenReceivingANilLocation() {
        let sut = createSUT()
        sut.updateLocation(CLLocation.stub)
        XCTAssertEqual(sut.geohash5, "u31nz")
        
        sut.updateLocation(nil)
        XCTAssertEqual(sut.geohash5, nil)
    }
    
    func test_postNotification_onSettingAGeohash5() {
        let sut = createSUT()

        let expectation = expectation(description: "Wait for geohash notification")
        let observer = NotificationCenter.default.addObserver(sut.notification) { _ in
            expectation.fulfill()
        }
        sut.updateLocation(CLLocation.stub)
        waitForExpectations(timeout: 1)
        
        NotificationCenter.default.removeObserver(observer)
    }

    func test_postNotification_onlyWhenTheGeohash5HasChanged() {
        let sut = createSUT()
        sut.updateLocation(CLLocation.stub)
        XCTAssertEqual(sut.geohash5, "u31nz")
        
        let observer = NotificationCenter.default.addObserver(sut.notification) { _ in
            XCTAssert(false, "Should not post notification since geohash hasn't changed.")
        }
        sut.updateLocation(CLLocation.stub)
    
        NotificationCenter.default.removeObserver(observer)
    }
    
    private func createSUT() -> GeohashManager {
        GeohashManager(notification: "test")
    }
}

private extension CLLocation {
    
    static var stub: CLLocation {
        CLLocation(latitude: 51.83738, longitude: 12.98494)
    }
}

// GeohashManager
// - [X] Elke locatie update, bereken een nieuwe geohash.
// - [X] Als de locatie `nil` is dan moet de geohash5 ook `nil` zijn.
// - [X] Als de geohash5 is verandert, post dan een notificatie.

// Wat is de ahaa?

func test_workshop_isAwesome() {
    XCTAssert(true)
}
