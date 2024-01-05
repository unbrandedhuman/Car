//
//  MaintenanceRecordCard.swift
//  Car
//
//  Created by Matthew Smith on 1/5/24.
//

import SwiftUI

struct MaintenanceRecordCard: View {
    @Bindable var maintenance: Maintenance
    @EnvironmentObject var manager: GarageManager
    var body: some View {
        VStack(alignment: .leading, content: {
            Text(maintenance.date.formatted(date: .abbreviated, time: .omitted))
            
            ForEach(maintenance.types, id: \.self) { type in
                Text("-\(type.rawValue)")
                    .multilineTextAlignment(.leading)
            }
        })
    }
}

#Preview {
    MaintenanceRecordCard(maintenance: Maintenance(date: Date(), types: [.airFilter, .oilChange]))
}
