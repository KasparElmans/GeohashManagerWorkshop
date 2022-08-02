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
    
    public let geohashManager = geohashChecker
    
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





public class LocationChecker<T: Equatable> {
    
    var value: T?
    let map: (CLLocation?) -> T?
    public let notification: String
    
    init(map: @escaping (CLLocation?) -> T?, notification: String) {
        self.map = map
        self.notification = notification
    }
    
    public func updateLocation(_ location: CLLocation?) {
        let newValue = map(location)
        guard newValue != value else { return }
        value = newValue
        NotificationCenter.default.post(notification)
    }
}

let geohashChecker = LocationChecker<String>(map: { location in
    guard let location = location else { return nil }
    return Geohash.encode(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude, length: 5)
}, notification: "geohashChangedOn25MeterLocationUpdate")

let provinceChecker = LocationChecker<String>(map: { location in
    guard let location = location else { return nil }
    return Province(location: location)
}, notification: "newProvinceDetected")
