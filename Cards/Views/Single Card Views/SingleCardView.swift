//
//  SingleCardView.swift
//  Cards
//
//  Created by Gaspare Monte on 11/12/23.
//

import SwiftUI

struct SingleCardView: View {
    @Environment(\.dismiss) var dismiss

    @State private var currentModal: ToolbarSelection?

    var content: some View {
        ZStack {
            Group {
                Capsule()
                    .foregroundColor(.yellow)

                Text("Resize Me!")
                    .fontWeight(.bold)
                    .font(.system(size: 500))
                    .minimumScaleFactor(0.01)
                    .lineLimit(1)
            }
            .resizableView()

            Circle()
                .resizableView()
                .offset(CGSize(width: 50, height: 200))
        }
    }

    var body: some View {
        NavigationStack {
            content
                .modifier(CardToolbar(currentModal: $currentModal))
        }
    }
}

#Preview {
    SingleCardView()
}
