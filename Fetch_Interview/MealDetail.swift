import Foundation

struct MealResponse: Decodable {
    let meals: [MealDetail]
}

struct MealDetail: Decodable{
    let idMeal: String
    let strMeal: String
    let strCategory: String
    let strArea: String
    let strInstructions: String
    let strMealThumb: String
    let strTags: String?
    let strYoutube: String?
    let ingredients: [String]
    let measurements: [String]

    private enum CodingKeys: String, CodingKey {
        case idMeal, strMeal, strCategory, strArea, strInstructions, strMealThumb, strTags, strYoutube
        case strIngredient1, strIngredient2, strIngredient3, strIngredient4, strIngredient5, strIngredient6, strIngredient7, strIngredient8, strIngredient9, strIngredient10
        case strIngredient11, strIngredient12, strIngredient13, strIngredient14, strIngredient15, strIngredient16, strIngredient17, strIngredient18, strIngredient19, strIngredient20
        case strMeasure1, strMeasure2, strMeasure3, strMeasure4, strMeasure5, strMeasure6, strMeasure7, strMeasure8, strMeasure9, strMeasure10
        case strMeasure11, strMeasure12, strMeasure13, strMeasure14, strMeasure15, strMeasure16, strMeasure17, strMeasure18, strMeasure19, strMeasure20
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        idMeal = try container.decode(String.self, forKey: .idMeal)
        strMeal = try container.decode(String.self, forKey: .strMeal)
        strCategory = try container.decode(String.self, forKey: .strCategory)
        strArea = try container.decode(String.self, forKey: .strArea)
        strInstructions = try container.decode(String.self, forKey: .strInstructions)
        strMealThumb = try container.decode(String.self, forKey: .strMealThumb)
        strTags = try container.decodeIfPresent(String.self, forKey: .strTags)
        strYoutube = try container.decodeIfPresent(String.self, forKey: .strYoutube)
        
        // Decode ingredients and measurements
        var tempIngredients: [String] = []
        var tempMeasurements: [String] = []

        for i in 1...20 {
            if let ingredientKey = CodingKeys(stringValue: "strIngredient\(i)"),
               let ingredient = try container.decodeIfPresent(String.self, forKey: ingredientKey),
               !ingredient.isEmpty {
                tempIngredients.append(ingredient)
            }

            if let measureKey = CodingKeys(stringValue: "strMeasure\(i)"),
               let measurement = try container.decodeIfPresent(String.self, forKey: measureKey),
               !measurement.isEmpty {
                tempMeasurements.append(measurement)
            }
        }

        ingredients = tempIngredients
        measurements = tempMeasurements
    }
}
