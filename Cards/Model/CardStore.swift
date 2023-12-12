//
//  CardStore.swift
//  Cards
//
//  Created by Gaspare Monte on 12/12/23.
//

import SwiftUI

class CardStore: ObservableObject {
    @Published var cards: [Card] = []

    init(defaultData: Bool = false) {
        if defaultData {
            cards = initialCards
        }
    }
}
