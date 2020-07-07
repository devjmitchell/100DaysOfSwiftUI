//
//  Prospect.swift
//  HotProspects
//
//  Created by Jason Mitchell on 7/7/20.
//  Copyright © 2020 Jason Mitchell. All rights reserved.
//

import SwiftUI

class Prospect: Identifiable, Codable {
    let id = UUID()
    var name = "Anonymous"
    var emailAddress = ""
    var isContacted = false
}

class Prospects: ObservableObject {
    @Published var people: [Prospect]

    init() {
        self.people = []
    }
}
