//
//  GoeHashManagerTests.swift
//  GoeHashManagerTests
//
//  Created by Kaspar Elmans on 20/06/2022.
//

import XCTest
import GeohashManagerWorkshop

class GoeHashTests: XCTestCase {

    func test_findGeoHash() {
        let goeHash = Geohash.encode(latitude: 51.278179436, longitude: 16.27278726, length: 5)
        XCTAssertEqual(goeHash, "u35ed")
    }
    
    func test_measureSpeed5() {
        
        measure {
            for _ in 1...100 {
                let goeHash = Geohash.encode(latitude: 51.278179436, longitude: 16.27278726, length: 5)
                XCTAssertEqual(goeHash, "u35ed")
            }
        }
    }
    
    func test_measureSpeed7() {
        
        measure {
            for _ in 1...100 {
                let goeHash = Geohash.encode(latitude: 51.278179436, longitude: 16.27278726, length: 7)
                XCTAssertEqual(goeHash, "u35edqc")
            }
        }
    }
}
