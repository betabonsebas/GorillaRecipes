//
//  Recipe.swift
//  Recipes
//
//  Created by Sebastian Bonilla on 6/28/19.
//  Copyright © 2019 bonsebas. All rights reserved.
//

import Foundation

struct Recipe: Codable {
    var id: Int
    var title: String
    var rating: Int?
    var image: String?
    var instructions: String?
}
