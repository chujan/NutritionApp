//
//  CategoryResponse.swift
//  Nutrition
//
//  Created by Jennifer Chukwuemeka on 25/10/2022.
//

import Foundation
struct CategoryResponse: Codable {
    var categories :[Categories]
}
struct Categories: Codable{
    var idCategory = ""
 
    var strCategoryThumb = ""
    var strCategory = ""
    var strCategoryDescription = ""
    
    
}
