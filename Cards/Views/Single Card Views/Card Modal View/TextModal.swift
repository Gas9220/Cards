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
            .onSubmit {
                dismiss()
            }
            .padding(20)
    }
}

#Preview {
    TextModal(textElement: .constant(TextElement()))
}
