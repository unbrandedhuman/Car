//
//  AddMaintenanceCard.swift
//  Car
//
//  Created by Matthew Smith on 1/21/24.
//

import SwiftUI

struct AddMaintenanceCard: View {
    @Bindable var car: Car
    @State var maintenanceTypes: [MaintenanceTypes] = []
    @State var date = Date()
    @State var status: currentStatus = .idle
    var body: some View {
        VStack {
            if maintenanceTypes == [] {
                DatePicker("Log maintenance", selection: $date, displayedComponents: .date)
                    .padding(.horizontal)
            } else {
                HStack {
                    ForEach(maintenanceTypes, id: \.self) { type in
                        if type == .airFilter {
                            Text("💨")
                        } else if type == .oilChange {
                            Text("⛽️")
                        } else if type == .oilFilter {
                            Text("🛢️")
                        } else if type == .reprogramming {
                            Text("🖥️")
                        } else if type == .timingBelt {
                            Text("🎞️")
                        } else if type == .tireRotation {
                            Text("🛞")
                        }
                        
                        Text("+")
                    }
                }
            }
            
            HStack {
                // Functions
                VStack {
                    Button {
                        if status == .add {
                            maintenanceTypes.append(.airFilter)
                        } else if maintenanceTypes.isEmpty {
                            maintenanceTypes.append(.airFilter)
                        }
                    } label: {
                        MaintenanceCalcButton(type: .airFilter)
                    }.sensoryFeedback(.selection, trigger: maintenanceTypes)
                    
                    Button {
                        if status == .add {
                            maintenanceTypes.append(.oilChange)
                        } else if maintenanceTypes.isEmpty {
                            maintenanceTypes.append(.oilChange)
                        }
                    } label: {
                        MaintenanceCalcButton(type: .oilChange)
                    }.sensoryFeedback(.selection, trigger: maintenanceTypes)
                    
                    Button {
                        if status == .add {
                            maintenanceTypes.append(.oilFilter)
                        } else if maintenanceTypes.isEmpty {
                            maintenanceTypes.append(.oilFilter)
                        }
                    } label: {
                        MaintenanceCalcButton(type: .oilFilter)
                    }.sensoryFeedback(.selection, trigger: maintenanceTypes)
                }
                // Functions
                VStack {
                    Button {
                        if status == .add {
                            maintenanceTypes.append(.reprogramming)
                        } else if maintenanceTypes.isEmpty {
                            maintenanceTypes.append(.reprogramming)
                        }
                    } label: {
                        MaintenanceCalcButton(type: .reprogramming)
                    }.sensoryFeedback(.selection, trigger: maintenanceTypes)
                    
                    Button {
                        if status == .add {
                            maintenanceTypes.append(.timingBelt)
                        } else if maintenanceTypes.isEmpty {
                            maintenanceTypes.append(.timingBelt)
                        }
                    } label: {
                        MaintenanceCalcButton(type: .timingBelt)
                    }.sensoryFeedback(.selection, trigger: maintenanceTypes)
                    
                    Button {
                        if status == .add {
                            maintenanceTypes.append(.tireRotation)
                        } else if maintenanceTypes.isEmpty {
                            maintenanceTypes.append(.tireRotation)
                        }
                    } label: {
                        MaintenanceCalcButton(type: .tireRotation)
                    }.sensoryFeedback(.selection, trigger: maintenanceTypes)
                }
                // Operations
                VStack {
                    Button {
                        status = .back
                        if !maintenanceTypes.isEmpty {
                            maintenanceTypes.removeLast()
                        }
                    } label: {
                        MaintenanceCalcButton(operation: "minus")
                    }.sensoryFeedback(.selection, trigger: status)

                    Button {
                        status = .add
                    } label: {
                        MaintenanceCalcButton(operation: "plus")
                    }
                    
                    Button {
                        status = .forward
                    } label: {
                        MaintenanceCalcButton(operation: "continue")
                    }
                }
            }
        }
        .padding()
        .background(.ultraThinMaterial)
    }
}

struct MaintenanceCalcButton: View {
    @State var type: MaintenanceTypes?
    @State var operation: String?
    var body: some View {
        Circle()
            .fill(.ultraThinMaterial)
            .overlay {
                if type == .airFilter {
                    Text("💨")
                        .font(.system(size: 60))
                } else if type == .oilChange {
                    Text("⛽️")
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
                } else if operation == "minus" {
                    Image(systemName: "minus")
                        .foregroundStyle(Color.textColor)
                        .font(.system(size: 60))
                } else if operation == "plus" {
                    Image(systemName: "plus")
                        .foregroundStyle(Color.textColor)
                        .font(.system(size: 60))
                } else if operation == "continue" {
                    Image(systemName: "arrow.right")
                        .foregroundStyle(Color.textColor)
                        .font(.system(size: 60))
                }
            }
    }
}

enum currentStatus {
    case add
    case back
    case forward
    case idle
}

#Preview {
    AddMaintenanceCard(car: Car(
        name: "Car-1",
        make: "Letterdots",
        model: "Car 1",
        lastMaintenanceDate: Date(),
        maintenanceDates: [],
        miles: "123,456",
        purchaseDate: Date(),
        used: false,
        color: .green))
}
