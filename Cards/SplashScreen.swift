//
//  SplashScreen.swift
//  Cards
//
//  Created by Gaspare Monte on 18/12/23.
//

import SwiftUI

struct SplashScreen: View {
    var body: some View {
        card(letter: "C", color: "appColor7")
            .splashAnimation(finalYposition: 200, delay: 0)
    }

    func card(letter: String, color: String) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .shadow(radius: 3)
                .frame(width: 120, height: 160)
                .foregroundColor(.white)
            Text(letter)
                .fontWeight(.bold)
                .scalableText()
                .foregroundColor(Color(color))
                .frame(width: 80)
        }
    }
}

#Preview {
    SplashScreen()
}

private struct SplashAnimation: ViewModifier {
    @State private var animating = true
    let finalYPosition: CGFloat
    let delay: Double

    func body(content: Content) -> some View {
        content
            .offset(y: animating ? -700 : finalYPosition)
            .onAppear {
                animating = false
            }
    }
}

private extension View {
    func splashAnimation(finalYposition: CGFloat, delay: Double) -> some View {
        modifier(SplashAnimation(finalYPosition: finalYposition,delay: delay))
    }
}
