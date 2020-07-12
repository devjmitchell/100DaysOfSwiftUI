//
//  ContentView.swift
//  Flashzilla
//
//  Created by Jason Mitchell on 7/12/20.
//  Copyright © 2020 Jason Mitchell. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    // the following would give a 1/2 second tolerance
//    let timer = Timer.publish(every: 1, tolerance: 0.5, on: .main, in: .common).autoconnect()
    @State private var counter = 0

    var body: some View {
        Text("Hello, World!")
            .onReceive(timer) { time in
                if self.counter == 5 {
                    self.timer.upstream.connect().cancel()
                } else {
                    print("The time is now \(time)")
                }

                self.counter += 1
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
