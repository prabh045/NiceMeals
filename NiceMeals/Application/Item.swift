//
//  Item.swift
//  NiceMeals
//
//  Created by Prabhdeep Singh on 03/08/24.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
