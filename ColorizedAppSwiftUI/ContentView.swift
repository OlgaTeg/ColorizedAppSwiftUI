//
//  ContentView.swift
//  ColorizedAppSwiftUI
//
//  Created by Olga Tegza on 13.01.2023.
//

import SwiftUI

enum Field: Int {
    case red, green, blue
}

struct ContentView: View {
    
    @State private var redColor = Double.random(in: 0...255)
    @State private var greenColor = Double.random(in: 0...255)
    @State private var blueColor = Double.random(in: 0...255)
    
    @FocusState private var focusedField: Field?
    
    var body: some View {
        ZStack {
            LinearGradient(
                stops: [
                    SwiftUI.Gradient.Stop(color: .purple, location: 0.0),
                    SwiftUI.Gradient.Stop(color: .yellow, location: 0.5),
                    SwiftUI.Gradient.Stop(color: .mint, location: 1.0)
                ],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
            VStack(spacing: 20) {
                ColorView(
                    redColor: redColor,
                    greenColor: greenColor,
                    blueColor: blueColor
                )
                
                VStack {
                    ColorBlockView(
                        sliderValue: $redColor,
                        sliderColor: .red
                    )
                    .focused($focusedField, equals: .red)
                    
                    ColorBlockView(
                        sliderValue: $greenColor,
                        sliderColor: .green
                    ).focused($focusedField, equals: .green)
                    
                    ColorBlockView(
                        sliderValue: $blueColor,
                        sliderColor: .blue
                    ).focused($focusedField, equals: .blue)
                }
                
                Spacer()
            }
            .padding()
            .keyboardType(.numberPad)
            .toolbar(content: {
                ToolbarItemGroup(placement: .keyboard) {
                    Button (action: goUp) {
                        Image(systemName: "chevron.up")
                    }
                    .disabled(focusedField == .red ? true : false)
                    
                    Button (action: goDown) {
                        Image(systemName: "chevron.down")
                    }
                    .disabled(focusedField == .blue ? true : false)
                    
                    Spacer()
                    
                    Button("Done") {
                        focusedField = nil
                    }
                }
            })
        }
    }
    
    private func goUp() {
        focusedField = focusedField.map {
            Field(rawValue: $0.rawValue - 1) ?? .red
        }
    }
    
    private func goDown() {
        focusedField = focusedField.map {
            Field(rawValue: $0.rawValue + 1) ?? .blue
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
