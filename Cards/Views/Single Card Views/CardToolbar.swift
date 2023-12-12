//
//  CardToolbar.swift
//  Cards
//
//  Created by Gaspare Monte on 12/12/23.
//

import SwiftUI

struct CardToolbar: ViewModifier {
    @Environment(\.dismiss) var dismiss
    @Binding var currentModal: ToolbarSelection?
    
    func body(content: Content) -> some View {
        content
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Done") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .bottomBar) {
                    BottomToolbar(modal: $currentModal)
                }
            }
            .sheet(item: $currentModal) { item in
                switch item {
                case .stickerModal:
                    StickerModal()
                default:
                    Text(String(describing: item))
                }
            }
    }
}
