//
//  File.swift
//  Fetch_Interview
//
//  Created by Ting Qu on 6/16/24.
//

import Foundation

struct Meal: Codable, Identifiable{
    enum CodingKeys: String, CodingKey{
        case Meal = "strMeal"
        case MealThumb = "strMealThumb"
        case id = "idMeal"
    }
    let Meal: String
    let MealThumb:String
    let id: String
}

struct Meals: Codable {
    var meals: [Meal] = []
}
