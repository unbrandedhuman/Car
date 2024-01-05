//
//  CarView.swift
//  Car
//
//  Created by Matthew Smith on 1/2/24.
//

import SwiftUI

struct CarView: View {
    @Bindable var car: Car
    @State private var isActived = false
    @State private var currentPositionY: CGFloat = .fullScreenHeight * 0.83
    @State private var newPositionY: CGFloat = .zero
    
    var body: some View {
        let tap = TapGesture()
            .onEnded {
                togglePositionY()
                
                self.currentPositionY = self.newPositionY
            }
                
        let drag = DragGesture()
            .onChanged { value in
                withAnimation(.snappy().speed(2)) {
                    self.currentPositionY =
                    value.translation.height + self.newPositionY
                }
            }
            .onEnded { value in
                let offsetY = value.translation.height
                    if offsetY > 100 { isActived = true } else { isActived = false }

                togglePositionY()
                
                self.currentPositionY = self.newPositionY
            }
        
        ZStack {
            VStack {
                Text(car.name)
                    .font(.custom("Denver-Bold", size: 40, relativeTo: .largeTitle))
                    .textCase(.lowercase)
                    .minimumScaleFactor(0.4)
                
                Spacer()
                
                Image(systemName: "car.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
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
            .ignoresSafeArea()
            
            CarDetailView(car: car)
                .cornerRadius(32)
                .offset(y: currentPositionY)
                .gesture(drag)
                .gesture(tap)
        }.ignoresSafeArea()
    }
    
    private func togglePositionY() {
        isActived.toggle()
        newPositionY = isActived ?
            .fullScreenHeight * 0.1 : .fullScreenHeight * 0.83
    }
    
}

#Preview {
    CarView(car: Car(
        name: "Car-1",
        make: "Letterdots",
        model: "Car 1",
        lastMaintenanceDate: Date(),
        miles: "123,456",
        purchaseDate: Date(),
        used: false,
        color: .silver))
}
