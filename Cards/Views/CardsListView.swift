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
                if let index = store.index(for: card) {
                    SingleCardView(card: $store.cards[index])
                } else {
                    fatalError("Unable to locate selected card")
                }
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
