//
//  Car.swift
//  Car
//
//  Created by Matthew Smith on 1/2/24.
//

import Foundation
import SwiftUI
import SwiftData

@Model
final class Car {
    var name: String
    var make: String
    var model: String
    var lastMaintenanceDate: Date?
    var miles: String
    var purchaseDate: Date
    var used: Bool
    var color: CarColor
    
    init(name: String, make: String, model: String, lastMaintenanceDate: Date?, miles: String, purchaseDate: Date, used: Bool, color: CarColor) {
        self.name = name
        self.make = make
        self.model = model
        self.lastMaintenanceDate = lastMaintenanceDate
        self.miles = miles
        self.purchaseDate = purchaseDate
        self.used = used
        self.color = color
    }
}

enum CarColor: String, Codable, CaseIterable, Equatable {
    case gold = "Gold"
    case silver = "Silver"
    case red = "Red"
    case orange = "Orange"
    case yellow = "Yellow"
    case green = "Green"
    case blue = "Blue"
    case purple = "Purple"
    case pink = "Pink"
    case white = "White"
    case black = "Black"
}
