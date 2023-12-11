//
//  CardListView.swift
//  Cards
//
//  Created by Gaspare Monte on 11/12/23.
//

import SwiftUI

struct CardListView: View {
    @State private var isPresented = false

    var body: some View {
        ScrollView {
            VStack {
                ForEach(0..<10) { _ in
                    CardThumbnail()
                        .onTapGesture {
                            isPresented = true
                        }
                }
            }
        }
        .scrollIndicators(.hidden)
        .fullScreenCover(isPresented: $isPresented) {
            SingleCardView()
        }
    }
}

#Preview {
    CardListView()
}
