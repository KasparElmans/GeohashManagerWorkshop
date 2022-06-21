//
//  RealtimeLocationController.swift
//  GoeHashManager
//
//  Created by Kaspar Elmans on 20/06/2022.
//

import Foundation
import CoreLocation

public class RealtimeLocationController {
    
    static public let notification = "nNewRealtimeLocationArrived"
    
    static public var realtimeLocation: CLLocation?
    
    static public func updateNewLocation(_ location: CLLocation?) {
        realtimeLocation = location
        NotificationCenter.default.post(notification)
    }
}
