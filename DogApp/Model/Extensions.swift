//
//  Extensions.swift
//  DogApp
//
//  Created by 向前 on 7/16/23.
//

import Foundation
import SwiftUI

// It generate all possible sequences of a word in order to search (eg. Structs)
extension String {
    func generateStringSequence() -> [String] {
        guard self.count > 0 else {return []}
        var sequences: [String] = []
        let lowercaseSelf = self.lowercased()
        for i in 1...lowercaseSelf.count {
            sequences.append(String(lowercaseSelf.prefix(i)))
        }
        return sequences
    }
}

// It dismiss the keyboard and remove the textfields's first responder status (eg. HomeViewSearch)
#if canImport(UIKit)
extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif

// It dismisses keyboard (eg. HomeViewSearchHoverUp)
extension UIApplication {
    func dismissKeyboard() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
