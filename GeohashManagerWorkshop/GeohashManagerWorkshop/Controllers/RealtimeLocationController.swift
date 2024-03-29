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
    
    private init() { }
    
    public let notification = "nNewRealtimeLocationArrived"
    
    public var realtimeLocation: CLLocation?
    
    public func updateNewLocation(_ location: CLLocation?) {
        realtimeLocation = location
        NotificationCenter.default.post(notification)
    }
}
