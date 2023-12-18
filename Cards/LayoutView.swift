//
//  LayoutView.swift
//  Cards
//
//  Created by Gaspare Monte on 18/12/23.
//

import SwiftUI

struct LayoutView: View {
    var body: some View {
        GeometryReader { proxy in
            HStack {
                Text("Hello, World!")
                    .background(Color.red)

                Text("Hello, World!")
                    .padding()
                    .background(Color.red)
            }
            .frame(width: proxy.size.width * 0.8)
            .background(Color.gray)
            .padding(.leading, (proxy.size.width - proxy.size.width * 0.8) / 2)
        }
        .background(Color.yellow)
    }
}

#Preview(traits: .fixedLayout(width: 500, height: 300)) {
    LayoutView()
}
