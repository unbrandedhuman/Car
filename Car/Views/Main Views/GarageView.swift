//
//  GarageView.swift
//  Car
//
//  Created by Matthew Smith on 1/2/24.
//

import SwiftUI

struct GarageView: View {
    @State var cars: [Car]
    var body: some View {
        TabView {
            ForEach(cars) { car in
                CarView(car: car)
                    .ignoresSafeArea()
                    .tag(car)
            }
            CreateCarView()
                .tag(0)
        }.tabViewStyle(.page(indexDisplayMode: .never))
            .ignoresSafeArea(edges: .bottom)
    }
}

#Preview {
    GarageView(cars: [])
}
