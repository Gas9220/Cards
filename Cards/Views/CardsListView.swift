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
            Group {
                if store.cards.isEmpty {
                    initialView
                } else {
                    list
                }
            }
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

    var initialView: some View {
        VStack {
            Spacer()

            let card = Card(backgroundColor: Color(uiColor: .systemBackground))

            ZStack {
                CardThumbnail(card: card)
                Image(systemName: "plus.circle.fill")
                    .font(.largeTitle)
            }
            .frame(width: thumbnailSize.width * 1.2, height: thumbnailSize.height * 1.2)
            .onTapGesture {
                selectedCard = store.addCard()
            }

            Spacer()
        }
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
        .tint(.white)
    }
}


#Preview {
    CardsListView()
        .environmentObject(CardStore(defaultData: false))
}
