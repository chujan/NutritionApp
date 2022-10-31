//
//  RecommendedResponse.swift
//  Nutrition
//
//  Created by Jennifer Chukwuemeka on 25/10/2022.
//

import Foundation
struct RecommendedResponse: Codable {
    var meals: [Recommended]
}
struct Recommended: Codable {
    var strMeal = ""
    var strMealThumb = ""
    var strInstructions = ""
    var strYoutube = ""
}
