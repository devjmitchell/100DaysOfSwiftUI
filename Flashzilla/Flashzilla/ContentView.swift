//
//  ContentView.swift
//  Flashzilla
//
//  Created by Jason Mitchell on 7/12/20.
//  Copyright © 2020 Jason Mitchell. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, World!")
            .onReceive(NotificationCenter.default.publisher(for: UIApplication.willResignActiveNotification)) { _ in
                print("Moving to the background!")
        }
        .onReceive(NotificationCenter.default.publisher(for: UIApplication.willEnterForegroundNotification)) { _ in
            print("Moving back to the foreground!")
        }
        .onReceive(NotificationCenter.default.publisher(for: UIApplication.userDidTakeScreenshotNotification)) { _ in
            print("User took a screenshot!")
        }
        
        /*
         There are many more... Some others to try are:
         
         - UIApplication.significantTimeChangeNotification is called when the user changes their clock or when daylight savings time changes.
         - UIResponder.keyboardDidShowNotification is called when the keyboard is shown.
         */
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
