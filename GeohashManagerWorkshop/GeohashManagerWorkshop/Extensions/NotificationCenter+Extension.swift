//
//  NotificationCenter+Extension.swift
//  GoeHashManager
//
//  Created by Kaspar Elmans on 20/06/2022.
//

import Foundation

public extension NotificationCenter {
    
    @discardableResult
    func addObserver(_ name: String, object: Any? = nil, queue: OperationQueue? = nil, using: @escaping (Notification) -> Void) -> NSObjectProtocol {
        return addObserver(forName: .init(name), object: object, queue: queue, using: using)
    }
    
    func post(_ name: String, object: Any? = nil, userInfo: [AnyHashable: Any]? = nil) {
        post(name: Notification.Name(name), object: object, userInfo: userInfo)
    }
}
