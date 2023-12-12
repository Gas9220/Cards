//
//  TextExtensions.swift
//  Cards
//
//  Created by Gaspare Monte on 12/12/23.
//

import SwiftUI

extension Text {
  func scalableText(font: Font = Font.system(size: 1000)) -> some View {
    self
      .font(font)
      .minimumScaleFactor(0.01)
      .lineLimit(1)
  }
}
