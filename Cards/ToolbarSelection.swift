//
//  ToolbarSelection.swift
//  Cards
//
//  Created by Gaspare Monte on 11/12/23.
//

import Foundation

enum ToolbarSelection: CaseIterable, Identifiable {
    case photoModal, frameModal, stickerModal, textModal

    var id: Int {
        hashValue
    }
}
