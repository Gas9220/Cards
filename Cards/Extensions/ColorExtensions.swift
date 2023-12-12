//
//  ColorExtensions.swift
//  Cards
//
//  Created by Gaspare Monte on 12/12/23.
//

import SwiftUI

extension Color {
    static let colors: [Color] = [.green, .red, .blue, .gray, .yellow, .pink, .orange, .purple]

    static func random() -> Color {
        colors.randomElement() ?? .black
    }
}
