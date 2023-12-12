//
//  ResizableView.swift
//  Cards
//
//  Created by Gaspare Monte on 12/12/23.
//

import SwiftUI

struct ResizableView: View {
    private let content = RoundedRectangle(cornerRadius: 30.0)
    private let color = Color.red

    @State private var transform = Transform()
    @State private var previousOffset: CGSize = .zero

    var dragGesture: some Gesture {
        DragGesture()
            .onChanged { value in
                transform.offset = value.translation + previousOffset
            }
            .onEnded { _ in
                previousOffset = transform.offset
            }
    }

    var body: some View {
        content
            .frame(width: transform.size.width, height: transform.size.height)
            .foregroundStyle(color)
            .offset(transform.offset)
            .gesture(dragGesture)
    }
}

#Preview {
    ResizableView()
}
