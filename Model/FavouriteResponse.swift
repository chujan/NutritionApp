//
//  FavouriteResponse.swift
//  Nutrition
//
//  Created by Jennifer Chukwuemeka on 26/10/2022.
//

import Foundation
struct FavouriteResponse: Codable {
    var meals: [Favourite]
}

struct Favourite: Codable {
    //var strArea = ""
    var strMeal = ""
    var strInstructions = ""
    var strMealThumb = ""
    var strYoutube = ""
}
