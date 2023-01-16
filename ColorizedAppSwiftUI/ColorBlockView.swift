//
//  ColorBlockView.swift
//  ColorizedAppSwiftUI
//
//  Created by Olga Tegza on 13.01.2023.
//

import SwiftUI

struct ColorBlockView: View {
    
    @Binding var sliderValue: Double
    @State private var text = ""
    
    let sliderColor: Color
    
    var body: some View {
        HStack {
            Text("\(lround(sliderValue))")
                .foregroundColor(.white)
                .frame(width: 40, height: 25, alignment: .leading)
            
            Slider(
                value: $sliderValue,
                in: 0...255,
                step: 1
            )
            .accentColor(sliderColor)
            .onChange(of: sliderValue) { newValue in
                text = "\(lround(newValue))"
            }
            
            TextFieldView(textValue: $text, value: $sliderValue)
        }
        .onAppear {
            text = "\(lround(sliderValue))"
        }
    }
}

struct ColorBlockView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color(.lightGray)
                .ignoresSafeArea()
            ColorBlockView(sliderValue: .constant(100), sliderColor: .red)
        }
    }
}
