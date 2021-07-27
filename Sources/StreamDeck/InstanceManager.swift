//
//  ContextManager.swift
//  
//
//  Created by Emory Dunn on 7/26/21.
//

import Foundation

public class InstanceManager {
    public private(set) var instances: Set<ActionEvent>
    
    public init(instances: Set<ActionEvent> = []) {
        self.instances = instances
    }
    
    func registerInstance(_ action: ActionEvent) {
        NSLog("Registered instance of \(action.action) at \(action.payload.coordinates).")
        instances.insert(action)
    }
    
    func removeInstance(_ action: ActionEvent) {
        NSLog("Removed instance of \(action.action) at \(action.payload.coordinates).")
        instances.remove(action)
    }
    
    public func instance(for context: String) -> ActionEvent? {
        instances.first { $0.context == context }
    }
    
    public func instances(with actionID: String) -> [ActionEvent] {
        instances.filter { $0.action == actionID.lowercased() }
    }
    
    public func instance(at coordinates: ActionEvent.Coordinates) -> ActionEvent? {
        instances.first { $0.payload.coordinates == coordinates }
    }
}
