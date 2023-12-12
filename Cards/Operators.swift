//
//  Operators.swift
//  Cards
//
//  Created by Gaspare Monte on 12/12/23.
//

import SwiftUI

func +(left: CGSize, right: CGSize) -> CGSize {
    CGSize(width: left.width + right.width, height: left.height + right.height)
}
