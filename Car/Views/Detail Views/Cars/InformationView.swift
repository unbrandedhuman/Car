//
//  InformationView.swift
//  Car
//
//  Created by Matthew Smith on 1/5/24.
//

import SwiftUI

struct InformationView: View {
    @Bindable var car: Car
    @Binding var isActive: Bool
    @EnvironmentObject var manager: GarageManager
    @GestureState var b1press = false
    @GestureState var b2press = false
    @State var b1Show = false
    @State var b2Show = false
    var body: some View {
        VStack {
            Text("About \(car.name)")
                .font(.custom("Denver-Bold", size: 25))
                .padding()
            
            if isActive {
                VStack {
                    HStack(alignment: .top) {
                        VStack(alignment: .leading) {
                            Text("Make: \(car.make)")
                                .multilineTextAlignment(.leading)
                            
                            Text("Model: \(car.model)")
                                .multilineTextAlignment(.leading)
                        }
                        
                        Spacer()
                        
                        VStack(alignment: .trailing) {
                            Text("Purchased \(car.purchaseDate.formatted(date: .abbreviated, time: .omitted))")
                                .multilineTextAlignment(.trailing)
                            
                            Text(car.used ? "\(car.name) was bought new" : "\(car.name) was bought used")
                                .multilineTextAlignment(.trailing)
                        }
                    }
                    VStack(alignment: .leading) {
                        if car.lastMaintenanceDate != nil {
                            Text("Last taken for maintenance on \(car.lastMaintenanceDate!.formatted(date: .abbreviated, time: .omitted))")
                                .multilineTextAlignment(.leading)
                        }
                    }
                }.padding()
                .transition(.opacity)
                
                HStack {
                    Text("New Maintenance")
                        .foregroundColor(manager.customColorReturn(car: car))
                        .padding()
                        .background {
                            RoundedRectangle(cornerRadius: 16)
                                .fill(Color.neutralColor)
                        }
                        .scaleEffect(b2press ? 1.3 : 1)
                        .animation(.spring(response: 0.5, dampingFraction: 0.6))
                        .gesture(
                            LongPressGesture(minimumDuration: 0.06)
                                .updating($b2press) { currentState, gestureState, transaction in
                                    gestureState = currentState
                                }
                                .onEnded { value in
                                    b2Show.toggle()
                                }
                        )
                    
                    Text("Edit Car")
                        .foregroundColor(manager.customColorReturn(car: car))
                        .padding()
                        .background {
                            RoundedRectangle(cornerRadius: 16)
                                .fill(Color.neutralColor)
                        }
                        .scaleEffect(b2press ? 1.3 : 1)
                        .animation(.spring(response: 0.5, dampingFraction: 0.6))
                        .gesture(
                            LongPressGesture(minimumDuration: 0.06)
                                .updating($b2press) { currentState, gestureState, transaction in
                                    gestureState = currentState
                                }
                                .onEnded { value in
                                    b2Show.toggle()
                                }
                        )
                }
            }
            
            Spacer()
            
            //Achievements with this car
            
            Spacer()
            
            Text("miles")
            
            Text(car.miles)
                .font(.custom("Outward-Block", size: 900))
                .textCase(.lowercase)
                .frame(maxWidth: UIScreen.main.bounds.width, maxHeight: 200, alignment: .bottom)
                .minimumScaleFactor(0.01)
                .lineLimit(1)
                .transition(.scale)
        }
    }
}

#Preview {
    InformationView(car: Car(
        name: "Car-1",
        make: "Letterdots",
        model: "Car 1",
        lastMaintenanceDate: Date(),
        maintenanceDates: [],
        miles: "123,456",
        purchaseDate: Date(),
        used: false,
        color: .green), isActive: .constant(true))
}
