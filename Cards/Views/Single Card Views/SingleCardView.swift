//
//  SingleCardView.swift
//  Cards
//
//  Created by Gaspare Monte on 11/12/23.
//

import SwiftUI

struct SingleCardView: View {
    @Environment(\.dismiss) var dismiss

    @State private var currentModal: ToolbarSelection?
    @Binding var card: Card

    var body: some View {
        NavigationStack {
            CardDetailView(card: $card)
                .modifier(CardToolbar(currentModal: $currentModal, card: $card))
                .onDisappear {
                    card.save()
                }
        }
    }
}

#Preview {
    SingleCardView(card: .constant(initialCards[0]))
}
