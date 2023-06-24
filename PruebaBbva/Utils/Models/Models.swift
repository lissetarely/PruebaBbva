//
//  Models.swift
//  PruebaBbva
//
//  Created by Liset Areli Sanchez Martinez on 23/06/23.
//

import UIKit

struct batteryModel {
    var battery_level: String = ""
    var timestamp_created: String = ""
    
    
    init(battery_level: String = "",  timestamp_created: String = UIView.generateTimestamp) {
        self.battery_level = battery_level
        self.timestamp_created = timestamp_created
    }
    
    init(dict: [String: Any]) {
        self.battery_level = dict["battery_level"] as? String ?? ""
        self.timestamp_created = dict["timestamp_created"] as? String ?? ""
    }
    
    var dict:[String:AnyObject] {
        return [
            "battery_level" : self.battery_level as AnyObject,
            "timestamp_created" : self.timestamp_created as AnyObject,
        ]
        
    }
}

