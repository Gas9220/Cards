//
//  BottomToolbar.swift
//  Cards
//
//  Created by Gaspare Monte on 11/12/23.
//

import SwiftUI

struct BottomToolbar: View {
    @EnvironmentObject var store: CardStore
    
    @Binding var modal: ToolbarSelection?
    @Binding var card: Card
    
    var body: some View {
        HStack(alignment: .bottom) {
            ForEach(ToolbarSelection.allCases) { selection in
                switch selection {
                case .photoModal:
                    Button {
                        modal = selection
                    } label: {
                        PhotosModal(card: $card)
                    }
                case .frameModal:
                    defaultButton(selection)
                        .disabled(
                            store.selectedElement == nil
                            || !(store.selectedElement is ImageElement))
                default:
                    defaultButton(selection)
                }
            }
        }
    }
    
    func defaultButton(_ selection: ToolbarSelection) -> some View {
        Button {
            modal = selection
        } label: {
            ToolbarButton(modal: selection)
        }
    }
}

#Preview {
    BottomToolbar(modal: .constant(.stickerModal), card: .constant(Card()))
        .environmentObject(CardStore())
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
