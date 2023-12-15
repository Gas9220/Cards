//
//  CardDetailView.swift
//  Cards
//
//  Created by Gaspare Monte on 12/12/23.
//

import SwiftUI

struct CardDetailView: View {
    @EnvironmentObject var store: CardStore
    @Binding var card: Card

    var body: some View {
        ZStack {
            card.backgroundColor

            ForEach($card.elements, id: \.id) { $element in
                CardElementView(element: element)
                    .border(
                        Settings.borderColor,
                        width: isSelected(element) ? Settings.borderWidth : 0
                    )
                    .elementContextMenu(card: $card, element: $element)
                    .resizableView(transform: $element.transform)
                    .frame(width: element.transform.size.width, height: element.transform.size.height)
                    .onTapGesture {
                        store.selectedElement = element
                    }
            }
        }
        .onDisappear {
            store.selectedElement = nil
        }
        .dropDestination(for: CustomTransfer.self) { items, location in
            print(location)
            Task {
                card.addElements(from: items)
            }
            return !items.isEmpty
        }
    }

    func isSelected(_ element: CardElement) -> Bool {
        store.selectedElement?.id == element.id
    }
}

struct CardDetailView_Previews: PreviewProvider {
    struct CardDetailPreview: View {
        @EnvironmentObject var store: CardStore

        var body: some View {
            CardDetailView(card: $store.cards[0])
        }
    }

    static var previews: some View {
        CardDetailPreview()
            .environmentObject(CardStore(defaultData: true))
    }
}


//private extension View {
//    @ViewBuilder
//    func overlay(element: CardElement, isSelected: Bool) -> some View {
//        if isSelected &&  {
//            self
//                .border(
//                    Settings.borderColor,
//                    width: Settings.borderWidth
//                )
//        } else {
//            self
//        }
//    }
//}
