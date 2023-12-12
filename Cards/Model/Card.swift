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
}
