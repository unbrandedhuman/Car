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
        .frame(maxWidth: UIScreen.main.bounds.width, maxHeight: UIScreen.main.bounds.height)
        .background {
            manager.customColorReturn(car: self.car)
        }
    }
}

#Preview {
    CarDetailView(car: Car(name: "Untitled", make: "Letterdots", model: "Car-1", lastMaintenanceDate: Date(), miles: "250,000", purchaseDate: Date(), used: false, color: .blue), isActive: .constant(true))
}
