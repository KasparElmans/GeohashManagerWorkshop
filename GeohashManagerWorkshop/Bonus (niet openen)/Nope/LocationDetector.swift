//
//  LocationDetector.swift
//  GeohashManagerWorkshop
//
//  Created by Kaspar Elmans on 02/08/2022.
//

import Foundation
import CoreLocation

//public class LocationChecker<T: Equatable> {
//
//    var value: T?
//    let map: (CLLocation?) -> T?
//    public let notification: String
//
//    init(map: @escaping (CLLocation?) -> T?, notification: String) {
//        self.map = map
//        self.notification = notification
//    }
//
//    public func update(location: CLLocation?) {
//        let newValue = map(location)
//        guard newValue != value else { return }
//        value = newValue
//        NotificationCenter.default.post(notification)
//    }
//}
//
//var geohashChecker: LocationChecker<String> {
//    LocationChecker<String>(map: { location in
//        guard let location = location else { return nil }
//        return Geohash.encode(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude, length: 5)
//    }, notification: "geohashChangedOn25MeterLocationUpdate")
//}

//var provinceChecker: LocationChecker<String> {
//    LocationChecker<String>(map: { location in
//        guard let location = location else { return nil }
//        return Province(location: location)
//    }, notification: "newProvinceDetected")
//}
