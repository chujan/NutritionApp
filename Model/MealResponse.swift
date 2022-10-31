//
//  MealResponse.swift
//  Nutrition
//
//  Created by Jennifer Chukwuemeka on 25/10/2022.
//

import Foundation
struct MealResponse: Codable {
    var meals : [Trending]
}

struct Trending: Codable {
    var idMeal = ""
    var strMeal = ""
    var strInstructions = ""
    var strMealThumb = ""
    var strYoutube = ""
}
