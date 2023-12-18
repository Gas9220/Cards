//
//  LayoutView.swift
//  Cards
//
//  Created by Gaspare Monte on 18/12/23.
//

import SwiftUI

struct LayoutView: View {
    var body: some View {
        HStack {
            Text("Hello, World!")
                .background(Color.red)

            Text("Hello, World!")
                .padding()
                .background(Color.red)
        }
        .background(Color.gray)
    }
}

#Preview(traits: .fixedLayout(width: 500, height: 300)) {
    LayoutView()
}
