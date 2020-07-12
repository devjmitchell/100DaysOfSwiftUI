//
//  ContentView.swift
//  LayoutAndGeometry
//
//  Created by Jason Mitchell on 7/12/20.
//  Copyright © 2020 Jason Mitchell. All rights reserved.
//

import SwiftUI

//struct ContentView: View {
//    var body: some View {
//        Text("Hello, world!")
//            .background(Color.red)
//            .position(x: 100, y: 100)
//    }
//}

//struct ContentView: View {
//    var body: some View {
//        Text("Hello, world!")
//            .position(x: 100, y: 100)
//            .background(Color.red)
//    }
//}

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .offset(x: 100, y: 100)
            .background(Color.red)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
