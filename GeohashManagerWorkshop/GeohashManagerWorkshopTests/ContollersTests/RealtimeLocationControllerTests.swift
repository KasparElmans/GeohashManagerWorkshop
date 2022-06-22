//
//  RealtimeLocationControllerTests.swift
//  GoeHashManagerTests
//
//  Created by Kaspar Elmans on 20/06/2022.
//

import XCTest
import GeohashManagerWorkshop
import CoreLocation

class RealtimeLocationControllerTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        
        RealtimeLocationController.shared.realtimeLocation = nil
    }

    func test_init_noLocation() {
        XCTAssertEqual(RealtimeLocationController.shared.realtimeLocation, nil)
    }
    
    func test_updateLocation() {
        let newLocation = CLLocation(latitude: 51.2231341, longitude: 26.29942442)
        RealtimeLocationController.shared.updateNewLocation(newLocation)
        XCTAssertEqual(RealtimeLocationController.shared.realtimeLocation, newLocation)
    }
    
    func test_postLocation() {
        let newLocation = CLLocation(latitude: 51.2231341, longitude: 26.29942442)
        
        let observer = NotificationCenter.default.addObserver(RealtimeLocationController.shared.notification) { _ in
            XCTAssertEqual(RealtimeLocationController.shared.realtimeLocation, newLocation)
        }
        
        RealtimeLocationController.shared.updateNewLocation(newLocation)
        NotificationCenter.default.removeObserver(observer)
    }
}
