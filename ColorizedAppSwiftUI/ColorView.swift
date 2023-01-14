//
//  ColorView.swift
//  ColorizedAppSwiftUI
//
//  Created by Olga Tegza on 13.01.2023.
//

import SwiftUI

struct ColorView: View {
    
    let redColor: Double
    let greenColor: Double
    let blueColor: Double
    
    var body: some View {
        
        Color(
            red: redColor/255,
            green: greenColor/255,
            blue: blueColor/255
        )
        .cornerRadius(30)
        .frame(height: 200)
        .overlay(
            RoundedRectangle(cornerRadius: 30)
                .stroke(Color.white, lineWidth: 5)
        )
    }
}

struct ColorView_Previews: PreviewProvider {
    static var previews: some View {
        ColorView(redColor: 170, greenColor: 100, blueColor: 150)
    }
}
