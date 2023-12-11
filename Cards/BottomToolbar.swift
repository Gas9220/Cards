//
//  BottomToolbar.swift
//  Cards
//
//  Created by Gaspare Monte on 11/12/23.
//

import SwiftUI

struct BottomToolbar: View {
    @Binding var modal: ToolbarSelection?

    var body: some View {
        HStack {
            Button {
                modal = .stickerModal
            } label: {
                ToolbarButton()
            }
        }
    }
}

#Preview {
    BottomToolbar(modal: .constant(.stickerModal))
}

struct ToolbarButton: View {
  var body: some View {
    VStack {
      Image(systemName: "heart.circle")
        .font(.largeTitle)
      Text("Stickers")
    }
    .padding(.top)
  }
}
