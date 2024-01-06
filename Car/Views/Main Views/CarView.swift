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
    
    private func togglePositionY() {
        isActive.toggle()
        newPositionY = isActive ?
          .fullScreenHeight * 0.1 : .fullScreenHeight * 0.83
    }
    
    var body: some View {
        let tap = TapGesture()
          .onEnded {
            togglePositionY()
              withAnimation(.snappy().speed(2)) { self.currentPositionY = self.newPositionY }
          }
        let drag = DragGesture()
          .onChanged { value in
            withAnimation(.default) {
              self.currentPositionY =
                value.translation.height + self.newPositionY
            }
          }
          .onEnded { value in
            let offsetY = value.translation.height
              withAnimation {
                  if offsetY > 100 { isActive = true } else { isActive = false }
              }

            togglePositionY()
            withAnimation(.snappy().speed(2)) { self.currentPositionY = self.newPositionY }
          }
        
        ZStack {
            VStack {
                Text(car.name)
                    .font(.custom("Denver-Bold", size: 40, relativeTo: .largeTitle))
                    .textCase(.lowercase)
                    .minimumScaleFactor(0.4)
                
                Spacer()
                
//                Image(systemName: "car.fill")
//                    .resizable()
//                    .aspectRatio(contentMode: .fit)
//                    .foregroundColor(manager.customColorReturn(car: self.car))
//                    .frame(width: 150)
                Image("CarBlack")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
//                    .foregroundColor(manager.customColorReturn(car: self.car))
                    .frame(width: 150)
                
                Spacer()
                
                Text("\(car.miles)" != "0" ? car.miles : "No miles")
                    .font(.custom("Outward-Block", size: 900))
                    .textCase(.lowercase)
                    .frame(maxWidth: UIScreen.main.bounds.width, maxHeight: 400)
                    .minimumScaleFactor(0.01)
                    .lineLimit(1)
                    .transition(.scale)
                    .padding()
                
                Spacer()
                
            }
            
            CarDetailView(car: car, isActive: $isActive)
                .transition(.identity)
                .cornerRadius(32)
                .gesture(drag)
                .gesture(tap)
                .offset(y: currentPositionY)
        }
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
