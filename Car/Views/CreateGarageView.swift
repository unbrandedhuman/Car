//
//  CreateGarageView.swift
//  Car
//
//  Created by Matthew Smith on 1/2/24.
//

import SwiftUI

struct CreateGarageView: View {
    @Environment(\.modelContext) private var modelContext
    @EnvironmentObject private var garageManager: GarageManager
    @Environment(\.presentationMode) var presentationMode
    @State var name: String = ""
    var body: some View {
        TextField("Let's make your Garage", text: $name)
        
        Button {
            let newGarage = Garage(built: Date(), name: name, cars: [])
            modelContext.insert(newGarage)
            garageManager.currentGarage = newGarage
            presentationMode.wrappedValue.dismiss()
        } label: {
            Text("Let's drive.")
                .foregroundColor(.neutralColor)
                .padding()
                .background {
                    RoundedRectangle(cornerRadius: 16)
                        .foregroundColor(.accentColor)
                }
        }

    }
}

#Preview {
    CreateGarageView()
}
