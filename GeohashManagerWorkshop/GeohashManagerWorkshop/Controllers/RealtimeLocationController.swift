//
//  RealtimeLocationController.swift
//  GoeHashManager
//
//  Created by Kaspar Elmans on 20/06/2022.
//

import Foundation
import CoreLocation

public class RealtimeLocationController {
    
    public static let shared = RealtimeLocationController()
    
    public let geohashManager = GeohashManager(notification: "geohashChangedOn25MeterLocationUpdate")
    
    private init() { }
    
    public let notification = "nNewRealtimeLocationArrived"
    
    public var realtimeLocation: CLLocation?
    
    public func updateNewLocation(_ location: CLLocation?) {
        realtimeLocation = location
        geohashManager.updateLocation(location)
        NotificationCenter.default.post(notification)
    }
}

public class GeohashManager {
    public let notification: String
    
    public private(set) var geohash5: String? {
        didSet {
            guard oldValue != geohash5 else { return }
            NotificationCenter.default.post(notification)
        }
    }
    
    init(notification: String) {
        self.notification = notification
    }
    
    public func updateLocation(_ location: CLLocation?) {
        guard let location = location else {
            geohash5 = nil
            return
        }
        geohash5 = Geohash.encode(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude, length: 5)
    }
}
