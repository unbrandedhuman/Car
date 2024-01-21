//
//  AddMaintenanceCard.swift
//  Car
//
//  Created by Matthew Smith on 1/21/24.
//

import SwiftUI

struct AddMaintenanceCard: View {
    @State var maintenanceTypes: [MaintenanceTypes] = []
    @State var date = Date()
    var body: some View {
        VStack {
            if maintenanceTypes == [] {
                DatePicker("Date", selection: $date, displayedComponents: .date)
                    .padding(.horizontal)
            } else {
                HStack {
                    ForEach(maintenanceTypes, id: \.self) { type in
                        if type == .airFilter {
                            Text("💨")
                        } else if type == .oilChange {
                            Text("💧")
                        } else if type == .oilFilter {
                            Text("🛢️")
                        } else if type == .reprogramming {
                            Text("🖥️")
                        } else if type == .timingBelt {
                            Text("🎞️")
                        } else if type == .tireRotation {
                            Text("🛞")
                        }
                        
                        if maintenanceTypes.last != type {
                            Text("+")
                        }
                    }
                }
            }
            
            HStack {
                // Functions
                VStack {
                    MaintenanceCalcButton(type: .airFilter)
                    
                    MaintenanceCalcButton(type: .oilChange)
                    
                    MaintenanceCalcButton(type: .oilFilter)
                }
                // Functions
                VStack {
                    MaintenanceCalcButton(type: .reprogramming)
                    
                    MaintenanceCalcButton(type: .timingBelt)
                    
                    MaintenanceCalcButton(type: .tireRotation)
                }
                // Operations
                VStack {
                    Circle()
                    
                    Circle()
                    
                    Circle()
                }
            }
        }
        .padding()
        .background(.ultraThinMaterial)
    }
}

struct MaintenanceCalcButton: View {
    @State var type: MaintenanceTypes
    var body: some View {
        Circle()
            .fill(.ultraThinMaterial)
            .overlay {
                if type == .airFilter {
                    Text("💨")
                        .font(.system(size: 60))
                } else if type == .oilChange {
                    Text("💧")
                        .font(.system(size: 60))
                } else if type == .oilFilter {
                    Text("🛢️")
                        .font(.system(size: 60))
                } else if type == .reprogramming {
                    Text("🖥️")
                        .font(.system(size: 60))
                } else if type == .timingBelt {
                    Text("🎞️")
                        .font(.system(size: 60))
                } else if type == .tireRotation {
                    Text("🛞")
                        .font(.system(size: 60))
                }
            }
    }
}

#Preview {
    AddMaintenanceCard()
}
