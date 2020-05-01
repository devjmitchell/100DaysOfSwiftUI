//
//  FilteredList.swift
//  CoreDataProject
//
//  Created by Jason Mitchell on 5/1/20.
//  Copyright © 2020 Jason Mitchell. All rights reserved.
//

import CoreData
import SwiftUI

struct FilteredList: View {
    var fetchRequest: FetchRequest<Singer>
    var singers: FetchedResults<Singer> { fetchRequest.wrappedValue } // if don't want to use `fetchRequest.wrappedValue`, we could use this computed property
    
    var body: some View {
        List(fetchRequest.wrappedValue, id: \.self) { singer in
            Text("\(singer.wrappedFirstName) \(singer.wrappedLastName)")
        }
    }
    
    init(filter: String) {
        fetchRequest = FetchRequest<Singer>(entity: Singer.entity(), sortDescriptors: [], predicate: NSPredicate(format: "lastName BEGINSWITH %@", filter))
    }
}
