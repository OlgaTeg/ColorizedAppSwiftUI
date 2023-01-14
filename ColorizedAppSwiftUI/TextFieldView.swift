//
//  TextFieldView.swift
//  ColorizedAppSwiftUI
//
//  Created by Olga Tegza on 14.01.2023.
//

import SwiftUI

struct TextFieldView: View {
    
    @Binding var textValue: String
    @Binding var value: Double
    
    @State private var showAlert = false
    
    var body: some View {
        
        TextField("", text: $textValue) { _ in
            checkValue()
        }
        .frame(width: 55, alignment: .trailing)
        .multilineTextAlignment(.trailing)
        .textFieldStyle(.roundedBorder)
        .keyboardType(.decimalPad)
        .alert(
            "Incorrect value",
            isPresented: $showAlert,
            actions: {}) {
                Text("Enter correct value from 0 to 255")
        }
    }
}

extension TextFieldView {
    private func checkValue() {
        if let value = Int(textValue), (0...255).contains(value) {
            self.value = Double(value)
            return
        }
        showAlert.toggle()
        textValue = "0"
        value = 0
    }
}

struct TextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color(.lightGray)
                .ignoresSafeArea()
            TextFieldView(textValue: .constant("100"), value: .constant(100))
        }
    }
}
