//
//  ContentView.swift
//  Instafilter
//
//  Created by Jason Mitchell on 5/4/20.
//  Copyright © 2020 Jason Mitchell. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var blurAmount: CGFloat = 0
    
    var body: some View {
        let blur = Binding<CGFloat>(
            get: {
                self.blurAmount
            },
            set: {
                self.blurAmount = $0
                print("New value is \(self.blurAmount)")
            }
        )
        
        return VStack {
            Text("Hello, World!")
                .blur(radius: blurAmount)
            
            Slider(value: blur, in: 0...20)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
