//
//  CardsListView.swift
//  Cards
//
//  Created by Gaspare Monte on 11/12/23.
//

import SwiftUI

struct CardsListView: View {
    @EnvironmentObject var store: CardStore

    @State private var isPresented = false

    var body: some View {
        list
            .fullScreenCover(isPresented: $isPresented) {
                SingleCardView()
            }
    }

    var list: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                ForEach(store.cards) { card in
                    CardThumbnail(card: card)
                        .onTapGesture {
                            isPresented = true
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
