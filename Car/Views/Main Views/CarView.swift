//
//  CarView.swift
//  Car
//
//  Created by Matthew Smith on 1/2/24.
//

import SwiftUI

struct CarView: View {
    @Bindable var car: Car
    @EnvironmentObject var manager: GarageManager
    @State private var isActive = false
    @State private var currentPositionY: CGFloat = .fullScreenHeight * 0.83
    @State private var newPositionY: CGFloat = .zero
    
    let gradient = LinearGradient(
            gradient: Gradient(stops: [
                .init(color: .neutralColor, location: 0),
                .init(color: .clear, location: 0.4)
            ]),
            startPoint: .bottom,
            endPoint: .top
        )
    
    var body: some View {
        VStack {
            Image("placeholder")
                        .resizable()
                        .ignoresSafeArea(edges: .top)
                        .aspectRatio(contentMode: .fit)
                        .overlay(
                            VStack {
                                HStack {
                                    ZStack(alignment: .top) {
                                        Button(action: {
                                            
                                        }, label: {
                                            Image(systemName: "gear")
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(maxWidth: 40)
                                                .foregroundColor(.normalButtonColor)
                                                .padding(8)
                                                .background(Circle().fill(.ultraThinMaterial))
                                        })
                                    }.padding(.horizontal, 10)
                                    Spacer()
                                    ZStack(alignment: .top) {
                                        Text(car.name)
                                            .font(.system(.largeTitle))
                                    }.padding(.horizontal, 10)
                                }
                                
                                ZStack(alignment: .bottom) {
                                    Color.clear
                                        .blur(radius: 20)
                                        .padding(-20)
                                        .clipped()
                                        .mask(gradient)
                                    
                                    gradient
                                }.ignoresSafeArea(edges: .top)
                            }
                        )
            
            Spacer()
            
            AddMaintenanceCard(car: car)
                .cornerRadius(55 - 10)
                .padding(10)
                .ignoresSafeArea()
            
        }
        .background(Color.neutral)
        .ignoresSafeArea(edges: .bottom)
    }
}

#Preview {
    CarView(car: Car(
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
