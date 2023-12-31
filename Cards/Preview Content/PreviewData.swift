//
//  PreviewData.swift
//  Cards
//
//  Created by Gaspare Monte on 12/12/23.
//

import SwiftUI


let initialCards: [Card] = [
    Card(backgroundColor: .green, elements: initialElements),
    Card(backgroundColor: .orange),
    Card(backgroundColor: .red),
    Card(backgroundColor: .purple),
    Card(backgroundColor: .yellow)
]


let initialElements: [CardElement] = [
    ImageElement(
        transform: Transform(
            size: CGSize(width: 255, height: 185),
            rotation: .init(degrees: 10),
            offset: CGSize(width: 40, height: -220)),
        uiImage: UIImage(named: "hedgehog1")),
    ImageElement(
        transform: Transform(offset: CGSize(width: -62, height: 0)),
        uiImage: UIImage(named: "hedgehog2")),
    ImageElement(
        transform: Transform(
            size: CGSize(width: 295, height: 210),
            rotation: .init(degrees: -15),
            offset: CGSize(width: -5, height: 178)),
        uiImage: UIImage(named: "hedgehog2")),
    TextElement(
        transform: Transform(
            size: Settings.defaultElementSize * 1.2,
            rotation: .zero,
            offset: CGSize(width: -38, height: -120)),
        text: "Hedgehogs!!!",
        textColor: .blue)
]

