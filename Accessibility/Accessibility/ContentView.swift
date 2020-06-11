//
//  ContentView.swift
//  Accessibility
//
//  Created by Jason Mitchell on 6/11/20.
//  Copyright © 2020 Jason Mitchell. All rights reserved.
//

import SwiftUI

struct ContentView: View {
//    @State private var estimate = 25.0
//
//    var body: some View {
//        Slider(value: $estimate, in: 0...50)
//            .padding()
//            .accessibility(value: Text("\(Int(estimate))"))
//    }
    @State private var rating = 3

    var body: some View {
        Stepper("Rate our service: \(rating)/5", value: $rating, in: 1...5)
            .accessibility(value: Text("\(rating) out of 5"))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
