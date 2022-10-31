//
//  SearchResponse.swift
//  Nutrition
//
//  Created by Jennifer Chukwuemeka on 26/10/2022.
//

import Foundation
struct SearchResponse: Codable {
    var meals : [Search]
}

struct Search: Codable {
    var idMeal = ""
    var strMeal = ""
    var strCategory = ""
    var strMealThumb = ""
    var strYoutube = ""
    var strInstructions = ""
}
