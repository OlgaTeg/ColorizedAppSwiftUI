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
            Text(sliderValue.formatted())
                .foregroundColor(.white)
                .frame(width: 40, height: 25, alignment: .leading)
            
            Slider(
                value: $sliderValue,
                in: 0...255,
                step: 1
            )
            .tint(sliderColor)
            .onChange(of: sliderValue) { newValue in
                text = sliderValue.formatted()
            }
            
            TextFieldView(textValue: $text, value: $sliderValue)
        }
        .onAppear {
            text = sliderValue.formatted()
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
