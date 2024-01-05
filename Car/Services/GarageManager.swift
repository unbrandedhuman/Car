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
    
    func customColorReturn(car: Car) -> Color {
        switch car.color {
        case .gold:
            return Color.yellow
        case .silver:
            return Color.gray
        case .red:
            return Color.red
        case .orange:
            return Color.orange
        case .yellow:
            return Color.yellow
        case .green:
            return Color.green
        case .blue:
            return Color.blue
        case .purple:
            return Color.purple
        case .pink:
            return Color.pink
        case .white:
            return Color.white
        case .black:
            return Color.black
        }
    }
}
