//
//  GeohashManagerIntegrationTests.swift
//  GeohashManagerWorkshopTests
//
//  Created by Kaspar Elmans on 21/06/2022.
//

import XCTest
import GeohashManagerWorkshop
import CoreLocation

class GeohashManagerIntegrationTests: XCTestCase {

    func test_postGeohashNotification_whenTheRealtimeLocationControllerReceivesANewLocation() {
    
        let sut = createSUT()
        
        let expectation = expectation(description: "Wait for geohash notification")
        let observer = NotificationCenter.default.addObserver(sut.geohashManager.notification) { _ in
            expectation.fulfill()
        }
        sut.realtimeLocationController.updateNewLocation(CLLocation.stub)
        waitForExpectations(timeout: 1)
        
        NotificationCenter.default.removeObserver(observer)
    }
    
    func createSUT() -> (realtimeLocationController: RealtimeLocationController, geohashManager: LocationChecker<String>) {
        (RealtimeLocationController.shared, RealtimeLocationController.shared.geohashManager)
    }
}

private extension CLLocation {
    
    static var stub: CLLocation {
        CLLocation(latitude: 52.83738, longitude: 11.98494)
    }
}
