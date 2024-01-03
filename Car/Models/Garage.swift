//
//  Item.swift
//  Car
//
//  Created by Matthew Smith on 1/2/24.
//

import Foundation
import SwiftData

@Model
final class Garage {
    var built: Date
    var name: String
    var cars: [Car]
    
    init(built: Date, name: String, cars: [Car]) {
        self.built = built
        self.name = name
        self.cars = cars
    }
}
