//
//  ContentView.swift
//  Animations
//
//  Created by Jason Mitchell on 12/26/19.
//  Copyright © 2019 Jason Mitchell. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var animationAmount: CGFloat = 1
    
    var body: some View {
        Button("Tap Me") {
            self.animationAmount += 1
        }
        .padding(50)
        .background(Color.red)
        .foregroundColor(.white)
        .clipShape(Circle())
        .scaleEffect(animationAmount)
        .blur(radius: (animationAmount - 1) * 3)
//        .animation(.default)
//        .animation(.interpolatingSpring(stiffness: 50, damping: 1))
//        .animation(.easeInOut(duration: 2))
        .animation(
            Animation.easeInOut(duration: 1)
//                .delay(1)
//                .repeatCount(3, autoreverses: true)
                .repeatForever(autoreverses: true)
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
