//
//  ContentView.swift
//  SnowSeeker
//
//  Created by Jason Mitchell on 7/12/20.
//  Copyright © 2020 Jason Mitchell. All rights reserved.
//

import SwiftUI

struct User: Identifiable {
    var id = "Taylor Swift"
}

struct ContentView: View {
    @State private var selectedUser: User? = nil

    var body: some View {
        Text("Hello, World!")
            .onTapGesture {
                self.selectedUser = User()
        }
            .alert(item: $selectedUser) { user in
                Alert(title: Text(user.id))
            }
    }
}

//struct ContentView: View {
//    @State private var selectedUser: User? = nil
//    @State private var isShowingAlert = false
//
//    var body: some View {
//        Text("Hello, World!")
//            .onTapGesture {
//                self.selectedUser = User()
//                self.isShowingAlert = true
//            }
//            .alert(isPresented: $isShowingAlert) {
//                Alert(title: Text(selectedUser!.id))
//            }
//    }
//}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
