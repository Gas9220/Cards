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
            GeometryReader { proxy in
                CardDetailView(card: $card, viewScale: Settings.calculateScale(proxy.size), proxy: proxy)
                    .modifier(CardToolbar(currentModal: $currentModal, card: $card))
                    .frame(width: Settings.calculateSize(proxy.size).width,
                           height: Settings.calculateSize(proxy.size).height)
                    .clipped()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .onDisappear {
                        let uiImage = UIImage.screenshot(card: card, size: Settings.cardSize * 0.2)
                        _ = uiImage.save(to: card.id.uuidString)
                        card.uiImage = uiImage
                        card.save()
                }
            }
        }
    }
}

#Preview {
    SingleCardView(card: .constant(initialCards[0]))
        .environmentObject(CardStore())
}
