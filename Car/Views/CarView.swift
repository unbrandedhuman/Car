//
//  CarView.swift
//  Car
//
//  Created by Matthew Smith on 1/2/24.
//

import SwiftUI

struct CarView: View {
    @Bindable var car: Car
    var body: some View {
        TextField("Car Name", text: $car.name)
    }
}

#Preview {
    CarView(car: Car(
        name: "Default Car",
        make: "Letterdots",
        model: "Car 1",
        lastMaintenanceDate: Date(),
        miles: "0",
        purchaseDate: Date(),
        used: false,
        color: .black))
}
