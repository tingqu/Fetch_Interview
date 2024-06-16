//
//  Item.swift
//  Fetch_Interview
//
//  Created by Ting Qu on 6/14/24.
//

import SwiftUI

struct Item: View {
    var meal: Meal
    var body: some View {
        NavigationLink(destination: DetailPage()) {
            HStack{
                fetchImage(by: meal.MealThumb)
                VStack(alignment:.leading,spacing: 5){
                    Text(meal.Meal)
                        .bold()
                    Text("Malasiyan")
                        .font(.caption)
                }
                Spacer()
            }
        }
    }
}

#Preview {
    List{
        var meal = Meal(Meal: "name", MealThumb: "", id:"1")
        Item(meal:meal)
    }
}
