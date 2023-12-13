//
//  BottomToolbar.swift
//  Cards
//
//  Created by Gaspare Monte on 11/12/23.
//

import SwiftUI

struct BottomToolbar: View {
    @Binding var modal: ToolbarSelection?
    @Binding var card: Card

    var body: some View {
        HStack {
            ForEach(ToolbarSelection.allCases) { selection in
                switch selection {
                case .photoModal:
                    Button {
                        modal = selection
                    } label: {
                        PhotosModal(card: $card)
                    }
                default:
                    Button {
                        modal = selection
                    } label: {

                    }
                }
            }
        }
    }
}

#Preview {
    BottomToolbar(modal: .constant(.stickerModal), card: .constant(Card()))
}

struct ToolbarButton: View {
    let modal: ToolbarSelection

    private let modalButton: [ToolbarSelection: (text: String, imageName: String)] = [
        .photoModal: ("Photos", "photo"),
        .frameModal: ("Frames", "square.on.circle"),
        .stickerModal: ("Stickers", "heart.circle"),
        .textModal: ("Text", "textformat")
    ]

    var body: some View {
        if let text = modalButton[modal]?.text,
           let imageName = modalButton[modal]?.imageName {
            VStack {
                Image(systemName: imageName)
                    .font(.largeTitle)

                Text(text)
            }
            .padding(.top)
        }
    }
}
