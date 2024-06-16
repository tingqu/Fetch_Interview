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
                fetchImage(by: meal.imgUrl)
                VStack(alignment:.leading,spacing: 5){
                    Text(meal.name)
                        .bold()
                }
                Spacer()
            }
        }
    }
}

#Preview {
    List{
        var meal = Meal(name: "name", imgUrl: "", id:"1")
        Item(meal:meal)
    }
}
