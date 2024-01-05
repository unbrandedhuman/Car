//
//  MaintenanceRecordView.swift
//  Car
//
//  Created by Matthew Smith on 1/5/24.
//

import SwiftUI

struct MaintenanceRecordView: View {
    @Bindable var car: Car
    @Binding var isActive: Bool
    @EnvironmentObject var manager: GarageManager
    var body: some View {
        Text("Maintenance Record")
        
        ForEach(car.maintenanceDates, id: \.self) { date in
            
        }
    }
}

#Preview {
    MaintenanceRecordView(car: Car(name: "Untitled", make: "Letterdots", model: "Car-1", lastMaintenanceDate: Date(), maintenanceDates: [], miles: "250,000", purchaseDate: Date(), used: false, color: .blue), isActive: .constant(true))
}
