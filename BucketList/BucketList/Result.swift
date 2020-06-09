//
//  Result.swift
//  BucketList
//
//  Created by Jason Mitchell on 6/9/20.
//  Copyright © 2020 Jason Mitchell. All rights reserved.
//

import Foundation

struct Result: Codable {
    let query: Query
}

struct Query: Codable {
    let pages: [Int: Page]
}

struct Page: Codable {
    let pageid: Int
    let title: String
    let terms: [String: [String]]?
}
