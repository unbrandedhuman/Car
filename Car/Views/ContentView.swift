//
//  ContentView.swift
//  Car
//
//  Created by Matthew Smith on 1/2/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @EnvironmentObject private var garageManager: GarageManager
    @Query private var garages: [Garage]
    @Query private var cars: [Car]

    var body: some View {
        if garages.isEmpty {
            CreateGarageView()
                .transition(.opacity)
                .onAppear {
                    prepareUI()
                }
        } else {
            if cars.isEmpty {
                CreateCarView()
                    .transition(.opacity)
                    .onAppear {
                        prepareUI()
                    }
            } else {
                GarageView(cars: cars)
                    .transition(.opacity)
                    .onAppear {
                        prepareUI()
                    }
            }
        }
    }

    private func addItem(name: String, make: String, model: String, lastMaintencanceDate: Date, miles: String, purchaseDate: Date, used: Bool, color: CarColor) {
        withAnimation {
            let newItem = Car(name: name, make: make, model: model, lastMaintenanceDate: lastMaintencanceDate, miles: miles, purchaseDate: purchaseDate, used: used, color: color)
            modelContext.insert(newItem)
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(cars[index])
            }
        }
    }
    
    private func prepareUI() {
        garageManager.cars = cars
        garageManager.currentGarage = garages.first
        garageManager.currentCar = cars.first
    }
}

#Preview {
    ContentView()
        .modelContainer(for: [Garage.self, Car.self], inMemory: true)
}
