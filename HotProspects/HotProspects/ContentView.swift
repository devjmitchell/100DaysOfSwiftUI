//
//  ContentView.swift
//  HotProspects
//
//  Created by Jason Mitchell on 7/2/20.
//  Copyright © 2020 Jason Mitchell. All rights reserved.
//

import SwiftUI

struct ContentView: View {    
    var body: some View {
        Image("example")
            .interpolation(.none)
            .resizable()
            .scaledToFit()
            .frame(maxHeight: .infinity)
            .background(Color.black)
            .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
