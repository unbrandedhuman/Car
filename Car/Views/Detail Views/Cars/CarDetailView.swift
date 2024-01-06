//
//  CarDetailView.swift
//  Car
//
//  Created by Matthew Smith on 1/3/24.
//

import SwiftUI

struct CarDetailView: View {
    @Bindable var car: Car
    @Binding var isActive: Bool
    @EnvironmentObject var manager: GarageManager
    @GestureState var b1press = false
    @GestureState var b2press = false
    @State var b1Show = false
    @State var b2Show = false
    var body: some View {
        TabView {
            InformationView(car: car, isActive: $isActive)
                .tag(0)
            
            MaintenanceRecordView(car: car, isActive: $isActive)
                .tag(1)
        }.tabViewStyle(.page(indexDisplayMode: .automatic))
        .frame(maxWidth: UIScreen.main.bounds.width, maxHeight: UIScreen.main.bounds.height)
        .background {
            manager.customColorReturn(car: self.car)
        }
    }
}

#Preview {
    CarDetailView(car: Car(name: "Untitled", make: "Letterdots", model: "Car-1", lastMaintenanceDate: Date(), maintenanceDates: [], miles: "250,000", purchaseDate: Date(), used: false, color: .blue), isActive: .constant(true))
}
