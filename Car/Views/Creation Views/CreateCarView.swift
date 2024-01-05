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
    @State var miles: String = ""
    @State var purchaseDate: Date = Date()
    @State var used: Bool = false
    @State var color: CarColor = .blue
    @GestureState var press = false
    @State var show = false
    
    var body: some View {
        
        Text("Let's make your Car.")
        
        VStack {
            TextField("Name your car!", text: $name)
                .padding(10)
            
            Divider()
            
            TextField("Who made it?", text: $make)
                .padding(10)
            
            Divider()
            
            if make == "" {
                TextField("What kind of car is it?", text: $model)
                    .padding(10)
            } else {
                TextField("What kind of \(make) is it?", text: $model)
                    .padding(10)
            }
        }
        .background {
            RoundedRectangle(cornerRadius: 16)
                .fill(.ultraThinMaterial)
        }
        .padding(.horizontal)
        
        VStack {
            if name.isEmpty {
                Toggle("Did you get it new?", isOn: $used)
                    .padding(10)
            } else {
                Toggle("Did you get \(name) new?", isOn: $used)
                    .padding(10)
            }
            
            Divider()
            
            DatePicker("When did you get it?", selection: $purchaseDate)
                .padding(10)
            
            Divider()
            
            TextField("How many miles does it have right now?", text: $miles)
                .keyboardType(.numberPad)
                .padding(10)
        }.background {
            RoundedRectangle(cornerRadius: 16)
                .fill(.ultraThinMaterial)
        }
        .padding(.horizontal)
        
        VStack {
            Text("Put \(name) in the garage!")
                .foregroundColor(show ? Color.accent : Color.neutralColor)
                .padding()
                .background {
                    if show {
                        RoundedRectangle(cornerRadius: 16)
                            .fill(Color.neutralColor)
                    } else {
                        RoundedRectangle(cornerRadius: 16)
                            .fill(.accent)
                    }
                }
                .scaleEffect(press ? 1.3 : 1)
                .animation(.spring(response: 0.4, dampingFraction: 0.6))
                .gesture(
                    LongPressGesture(minimumDuration: 0.3)
                        .updating($press) { currentState, gestureState, transaction in
                            gestureState = currentState
                        }
                        .onEnded { value in
                            show.toggle()
                            if name != "" && make != "" && model != "" {
                                let newCar = Car(name: name, make: make, model: model, lastMaintenanceDate: nil, maintenanceDates: [], miles: miles, purchaseDate: purchaseDate, used: used, color: color)
                                modelContext.insert(newCar)
                                let generator = UINotificationFeedbackGenerator()
                                generator.notificationOccurred(.success)
                            } else {
                                let generator = UINotificationFeedbackGenerator()
                                generator.notificationOccurred(.error)
                            }
                        }
                )
        }
    }
}

#Preview {
    CreateCarView()
}
