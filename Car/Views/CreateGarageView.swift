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
    @GestureState var press = false
    @State var show = false
    var body: some View {
        Image("meetcaragain")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 900)
            .foregroundColor(.accent)
            .minimumScaleFactor(0.01)
        
        Spacer()
        
        TextField("Let's name your garage.", text: $name)
            .padding()
            .background {
                RoundedRectangle(cornerRadius: 16)
                    .fill(.ultraThinMaterial)
            }
            .padding(.horizontal)
        
        Text("Let's drive.")
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
                    if name != "" {
                        show.toggle()
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                            withAnimation(.snappy) {
                                let newGarage = Garage(built: Date(), name: name, cars: [])
                                modelContext.insert(newGarage)
                                garageManager.currentGarage = newGarage
                                presentationMode.wrappedValue.dismiss()
                                let generator = UINotificationFeedbackGenerator()
                                generator.notificationOccurred(.success)
                            }
                        }
                    } else {
                        let generator = UINotificationFeedbackGenerator()
                        generator.notificationOccurred(.error)
                    }
                }
        )
        .padding()

    }
}

#Preview {
    CreateGarageView()
}
