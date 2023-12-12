//
//  CardsListView.swift
//  Cards
//
//  Created by Gaspare Monte on 11/12/23.
//

import SwiftUI

struct CardsListView: View {
    @EnvironmentObject var store: CardStore

    @State private var selectedCard: Card?

    var body: some View {
        list
            .fullScreenCover(item: $selectedCard) { card in
                SingleCardView(card: card)
            }
    }

    var list: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                ForEach(store.cards) { card in
                    CardThumbnail(card: card)
                        .onTapGesture {
                            selectedCard = card
                        }
                }
            }
        }
    }
}


#Preview {
    CardsListView()
        .environmentObject(CardStore(defaultData: true))
}
