//
//  Create Car View.swift
//  Car
//
//  Created by Matthew Smith on 1/2/24.
//

import SwiftUI

struct CreateCarView: View {
    @Environment(\.modelContext) private var modelContext
    @State var name: String = ""
    @State var make: String = ""
    @State var model: String = ""
    @State var lastMaintenanceDate: Date = Date()
    @State var miles: String = ""
    @State var purchaseDate: Date = Date()
    @State var used: Bool = false
    @State var color: CarColor = .blue
    
    var body: some View {
        Text("Let's make your Car.")
        
        Form(content: {
            Section("Basic Things") {
                TextField("Name your car!", text: $name)
                TextField("Who made it?", text: $make)
                if make == "" {
                    TextField("What kind of car is it?", text: $model)
                } else {
                    TextField("What kind of \(make) is it?", text: $model)
                }
            }
            
            Section("Extra details") {
                Toggle("Did you get \(name) new?", isOn: $used)
                DatePicker("When did you get it?", selection: $purchaseDate)
                DatePicker("When did you last have it worked on?", selection: $lastMaintenanceDate)
                TextField("How many miles does it have?", text: $miles)
                    .keyboardType(.numberPad)
            }
            
            Button {
                if name != "" && make != "" && model != "" {
                    let newCar = Car(name: name, make: make, model: model, lastMaintenanceDate: lastMaintenanceDate, miles: miles, purchaseDate: purchaseDate, used: used, color: color)
                    modelContext.insert(newCar)
                }
            } label: {
                Text("Put \(name) in the garage!")
            }
        })
    }
}

#Preview {
    CreateCarView()
}
