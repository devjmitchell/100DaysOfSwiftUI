//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Jason Mitchell on 10/30/19.
//  Copyright © 2019 Jason Mitchell. All rights reserved.
//

import SwiftUI

struct CustomModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.blue)
    }
}

extension View {
    func customStyle() -> some View {
        self.modifier(CustomModifier())
    }
}

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Not using extension")
                .modifier(CustomModifier())
            Text("Using extension")
                .customStyle()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
