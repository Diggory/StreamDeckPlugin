//
//  DecrementAction.swift
//
//
//  Created by Emory Dunn on 12/19/21.
//

import Foundation
import StreamDeck

class DecrementAction: Action {

	typealias Settings = NoSettings
    
    static var name: String = "Decrement"
    
    static var uuid: String = "counter.decrement"
    
    static var icon: String = "Icons/actionIcon"
    
    static var states: [PluginActionState]? = [
        PluginActionState(image: "Icons/actionDefaultImage", titleAlignment: .middle)
    ]
    
    static var propertyInspectorPath: String?
    
    static var supportedInMultiActions: Bool?
    
    static var tooltip: String?
    
    static var visibleInActionsList: Bool?

    var context: String
    
	var coordinates: StreamDeck.Coordinates?
    
    @Environment(PluginCount.self) var count: Int
    
    required init(context: String, coordinates: StreamDeck.Coordinates?) {
        self.context = context
        self.coordinates = coordinates
    }
    
    func keyDown(device: String, payload: KeyEvent<Settings>) {
        count -= 1
    }

}
