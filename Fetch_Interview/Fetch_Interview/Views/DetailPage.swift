//
//  DetailPage.swift
//  Fetch_Interview
//
//  Created by Ting Qu on 6/14/24.
//

import SwiftUI
import TagCloud

struct DetailPage: View {
    
    var ingredients = ["Eggs", "Oils"]
    var measures = ["200ml","100ml"]
    var tags = ["puddings"]
    var body: some View {
        ScrollView{
            VStack(alignment:.leading){
                Text("Apam balik")
                    .font(.largeTitle)
                    .bold()
                
                Image("img1")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(.bottom)
                
                Divider()
                    .frame(height: 3)
                
                Text("Ingredient")
                    .font(.title2)
                    .bold()
                
                ForEach(0..<ingredients.count) { i in
                    HStack{
                        Text(ingredients[i])
                        Spacer()
                        Text(measures[i])
                            .font(.caption)
                    }
                    .padding(.vertical, 2)
                }
                
                Divider()
                
                Text("Instruction")
                    .font(.title2)
                    .bold()
                
                Text("""
                     Heat oven to 190C/170C fan/gas 5.Tip the flour and sugar into a large bowl.
                     Add the butter, then rub into the flour using your fingertips to make a light breadcrumb texture.
                     Do not overwork it or the crumble will become heavy.
                     Sprinkle the mixture evenly over a baking sheet and bake for 15 mins or until lightly coloured.\r\nMeanwhile, for the compote, peel, core and cut the apples into 2cm dice.
                     Put the butter and sugar in a medium saucepan and melt together over a medium heat.
                     Cook for 3 mins until the mixture turns to a light caramel. 
                     Stir in the apples and cook for 3 mins.
                     Add the blackberries and cinnamon, and cook for 3 mins more. 
                     Cover, remove from the heat, then leave for 2-3 mins to continue cooking in the warmth of the pan.
                     To serve, spoon the warm fruit into an ovenproof gratin dish, top with
                     the crumble mix, then reheat in the oven for 5-10 mins.
                     Serve with vanilla ice cream
                     """)
                
                Divider()
                
                Text("Tags")
                    .font(.title2)
                    .bold()
                
                ForEach(0..<tags.count) { i in
                   Text(tags[i])
                        .padding()
                        .background(.blue)
                        .cornerRadius(5.0)
                }
            }
        }
        .padding()
    }
}

#Preview {
    DetailPage()
}
