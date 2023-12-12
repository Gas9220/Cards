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

    var content: some View {
        card.backgroundColor
    }

    var body: some View {
        NavigationStack {
            content
                .modifier(CardToolbar(currentModal: $currentModal))
        }
    }
}

#Preview {
    SingleCardView(card: .constant(initialCards[0]))
}
