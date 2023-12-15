//
//  CardElement.swift
//  Cards
//
//  Created by Gaspare Monte on 12/12/23.
//

import SwiftUI

protocol CardElement {
    var id: UUID { get }
    var transform: Transform { get set }
}

extension CardElement {
    func index(in array: [CardElement]) -> Int? {
        array.firstIndex { $0.id == id }
    }
}

struct ImageElement: CardElement {
    var id = UUID()
    var transform = Transform()
    var frameIndex: Int?
    var image: Image {
      Image(uiImage: uiImage ?? UIImage(named: "error-image") ?? UIImage())
    }

    var uiImage: UIImage?
}

struct TextElement: CardElement {
  let id = UUID()
  var transform = Transform()
  var text = ""
  var textColor = Color.black
  var textFont = "Gill Sans"
}
