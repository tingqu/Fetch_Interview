//
//  File.swift
//  Fetch_Interview
//
//  Created by Ting Qu on 6/16/24.
//

import Foundation

struct Meal: Hashable,Codable, Identifiable{
    enum CodingKeys: String, CodingKey{
        case name = "strMeal"
        case imgUrl = "strMealThumb"
        case id = "idMeal"
    }
    let name: String
    let imgUrl:String
    let id: String
}

struct Meals: Codable{
    var meals: [Meal] = []
}
