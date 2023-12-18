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
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Environment(\.verticalSizeClass) var verticalSizeClass

    @State private var selectedCard: Card?

    var columns: [GridItem] {
        [
            GridItem(.adaptive(minimum: thumbnailSize.width))
        ]
    }

    var thumbnailSize: CGSize {
        var scale: CGFloat = 1
        if verticalSizeClass == .regular,
           horizontalSizeClass == .regular {
            scale = 1.5
        }
        return Settings.thumbnailSize * scale
    }

    var body: some View {
        VStack {
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

            createButton
        }
        .background(Color("background").ignoresSafeArea())
    }

    var list: some View {
        ScrollView(showsIndicators: false) {
            LazyVGrid(columns: columns, spacing: 30) {
                ForEach(store.cards) { card in
                    CardThumbnail(card: card)
                        .frame(width: thumbnailSize.width, height: thumbnailSize.height)
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
        .padding(.top, 20)
    }

    var createButton: some View {
        Button {
            selectedCard = store.addCard()
        } label: {
            Label("Create new", systemImage: "plus")
                .frame(maxWidth: .infinity)
        }
        .font(.system(size: 16, weight: .bold))
        .padding([.top, .bottom], 10)
        .background(Color("barColor"))
    }
}


#Preview {
    CardsListView()
        .environmentObject(CardStore(defaultData: true))
}
