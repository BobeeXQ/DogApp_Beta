//
//  TextFieldModifier.swift
//  DogApp
//
//  Created by 向前 on 7/10/23.
//

import SwiftUI

struct TextFieldModifer: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .padding(12)
            .background(Color(.systemGray6))
            .cornerRadius(10)
            .padding(.horizontal, 24)
    }
}
