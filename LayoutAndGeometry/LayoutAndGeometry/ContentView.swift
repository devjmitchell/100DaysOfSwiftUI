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
////        Text("Live long and prosper")
////            .frame(width: 300, height: 300, alignment: .topLeading)
//        HStack(alignment: .lastTextBaseline) {
//            Text("Live")
//                .font(.caption)
//            Text("long")
//            Text("and")
//                .font(.title)
//            Text("prosper")
//                .font(.largeTitle)
//        }
//    }
//}

//struct ContentView: View {
//    var body: some View {
//        VStack(alignment: .leading) {
//            Text("Hello, world!")
////                .alignmentGuide(.leading) { d in d[.leading] }
//                .alignmentGuide(.leading) { d in d[.trailing] }
//            Text("This is a longer line of text")
//        }
//        .background(Color.red)
//        .frame(width: 400, height: 400)
//        .background(Color.blue)
//    }
//}

struct ContentView: View {
    var body: some View {
        VStack(alignment: .leading) {
            ForEach(0..<10) { position in
                Text("Number \(position)")
                    .alignmentGuide(.leading) { _ in CGFloat(position) * -10 }
            }
        }
        .background(Color.red)
        .frame(width: 400, height: 400)
        .background(Color.blue)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
