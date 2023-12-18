//
//  CardThumbnail.swift
//  Cards
//
//  Created by Gaspare Monte on 11/12/23.
//

import SwiftUI

struct CardThumbnail: View {
    let card: Card

    var body: some View {
        RoundedRectangle(cornerRadius: 15)
            .foregroundStyle(card.backgroundColor)
    }
}

#Preview {
    CardThumbnail(card: initialCards[0])
        .frame(width: Settings.thumbnailSize.width, height: Settings.thumbnailSize.height)
}
