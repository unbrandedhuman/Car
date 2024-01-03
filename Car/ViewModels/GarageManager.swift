//
//  GarageManager.swift
//  Car
//
//  Created by Matthew Smith on 1/2/24.
//

import Foundation
import SwiftUI

class GarageManager: ObservableObject {
    @Published var currentGarage: Garage?
    @Published var currentCar: Car?
    @Published var cars: [Car]?
}
