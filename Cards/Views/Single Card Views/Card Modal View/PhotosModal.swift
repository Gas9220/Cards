//
//  PhotosModal.swift
//  Cards
//
//  Created by Gaspare Monte on 13/12/23.
//

import SwiftUI
import PhotosUI

struct PhotosModal: View {
    @Binding var card: Card

    @State private var selectedItems: [PhotosPickerItem] = []

    var body: some View {
        PhotosPicker(selection: $selectedItems, matching: .images) {
            ToolbarButton(modal: .photoModal)
        }
    }
}

#Preview {
    PhotosModal(card: .constant(Card()))
}
