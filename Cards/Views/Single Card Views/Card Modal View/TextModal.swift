//
//  TextModal.swift
//  Cards
//
//  Created by Gaspare Monte on 16/12/23.
//

import SwiftUI

struct TextModal: View {
    @Binding var textElement: TextElement

    @Environment(\.dismiss) var dismiss

    var body: some View {
        TextField("Enter text", text: $textElement.text)
            .font(.custom(textElement.textFont, size: 30))
            .foregroundStyle(textElement.textColor)
            .onSubmit {
                dismiss()
            }
            .padding(20)

        TextView(font: $textElement.textFont, color: $textElement.textColor)
    }
}

#Preview {
    TextModal(textElement: .constant(TextElement()))
}
