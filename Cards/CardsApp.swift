//
//  CardsApp.swift
//  Cards
//
//  Created by Gaspare Monte on 11/12/23.
//

import SwiftUI

@main
struct CardsApp: App {
    @StateObject var store = CardStore(defaultData: false)

    var body: some Scene {
        WindowGroup {
            AppLoadingView()
                .environmentObject(store)
                .onAppear {
                    print(URL.documentsDirectory)
                }
        }
    }
}
