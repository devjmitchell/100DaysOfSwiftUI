//
//  ContentView.swift
//  SnowSeeker
//
//  Created by Jason Mitchell on 7/12/20.
//  Copyright © 2020 Jason Mitchell. All rights reserved.
//

import SwiftUI

struct UserView: View {
    var body: some View {
        Group {
            Text("Name: Paul")
            Text("Country: England")
            Text("Pets: Luna, Arya, and Toby")
        }
    }
}

//struct ContentView: View {
//    @State private var layoutVertically = false
//
//    var body: some View {
//        Group {
//            if layoutVertically {
//                VStack {
//                    UserView()
//                }
//            } else {
//                HStack {
//                    UserView()
//                }
//            }
//        }
//        .onTapGesture {
//            self.layoutVertically.toggle()
//        }
//    }
//}

struct ContentView: View {
    @Environment(\.horizontalSizeClass) var sizeClass

    var body: some View {
        Group {
//            if sizeClass == .compact {
//                VStack {
//                    UserView()
//                }
//            } else {
//                HStack {
//                    UserView()
//                }
//            }
            if sizeClass == .compact {
                VStack(content: UserView.init)
            } else {
                HStack(content: UserView.init)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
