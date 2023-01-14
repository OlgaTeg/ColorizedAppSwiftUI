//
//  TextView.swift
//  ColorizedAppSwiftUI
//
//  Created by Olga Tegza on 14.01.2023.
//

import SwiftUI

struct TextView: View {
    
    let value: Double
    
    var body: some View {
        Text("\(lround(value))")
            .foregroundColor(.white)
            .frame(width: 40, height: 25, alignment: .leading)
    }
}

struct TextView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color(.lightGray)
                .ignoresSafeArea()
            TextView(value: 100)
        }
    }
}
