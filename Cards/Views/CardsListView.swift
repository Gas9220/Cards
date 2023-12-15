//
//  CardsListView.swift
//  Cards
//
//  Created by Gaspare Monte on 11/12/23.
//

import SwiftUI

struct CardsListView: View {
    @EnvironmentObject var store: CardStore

    @Environment(\.scenePhase) private var scenePhase

    @State private var selectedCard: Card?

    var body: some View {
        list
            .fullScreenCover(item: $selectedCard) { card in
                if let index = store.index(for: card) {
                    SingleCardView(card: $store.cards[index])
                        .onChange(of: scenePhase) { _, newValue in
                            if newValue == .inactive {
                                store.cards[index].save()
                            }
                        }
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
                        .contextMenu {
                            Button(role: .destructive) {
                                    store.remove(card)
                            } label: {
                                Label("Delete", systemImage: "trash")
                            }
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
