//
//  Card.swift
//  Cards
//
//  Created by Gaspare Monte on 12/12/23.
//

import SwiftUI

struct Card: Identifiable {
    let id = UUID()
    var backgroundColor: Color = .yellow
    var elements: [CardElement] = []
    
    mutating func addElement(uiImage: UIImage) {
        let element = ImageElement(uiImage: uiImage)
        elements.append(element)
    }

    mutating func addElement(text: TextElement) {
        elements.append(text)
    }

    mutating func addElements(from transfer: [CustomTransfer]) {
        for element in transfer {
            if let text = element.text {
                addElement(text: TextElement(text: text))
            } else if let image = element.image {
                addElement(uiImage: image)
            }
        }
    }
}
