//
//  ButtonStyles.swift
//  DogApp
//
//  Created by 向前 on 7/8/23.
//

import Foundation
import SwiftUI

struct QuestionnaireButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .background(lightGreen)
            .foregroundColor(darkGreen)
            .cornerRadius(25)
            .scaleEffect(configuration.isPressed ? 1.1 : 1)
            .animation(.easeOut(duration: 0.1), value: configuration.isPressed)
    }
}
