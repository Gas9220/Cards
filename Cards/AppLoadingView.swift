//
//  AppLoadingView.swift
//  Cards
//
//  Created by Gaspare Monte on 18/12/23.
//

import SwiftUI

struct AppLoadingView: View {
    @State private var showSplash = true

    var body: some View {
        if showSplash {
            SplashScreen()
                .ignoresSafeArea()
        } else {
            CardsListView()
        }
    }
}

#Preview {
    AppLoadingView()
        .environmentObject(CardStore(defaultData: true))
}
