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
        card.backgroundColor
            .clipShape(
                RoundedRectangle(cornerRadius: 10)
            )
            .shadow(color: Color("shadow-color"), radius: 3, x: 0, y: 0)
    }
}

#Preview {
    CardThumbnail(card: initialCards[0])
        .frame(width: Settings.thumbnailSize.width, height: Settings.thumbnailSize.height)
}
