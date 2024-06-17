//
//  DetailPage.swift
//  Fetch_Interview
//
//  Created by Ting Qu on 6/14/24.
//

import SwiftUI
import TagCloud

struct DetailPage: View {
    var id:String
    @ObservedObject var detailViewModel = MealDetailModel()
    func splitInstructions(instruction: String, separator:String) -> [String] {
        return instruction.split(separator: separator)
            .map {
                String($0).trimmingCharacters(in: .whitespacesAndNewlines)
            }
    }
    
    var body: some View {
        ScrollView{
            if let details = detailViewModel.meal_detail{
                VStack(alignment:.leading){
                    Text(details.strMeal)
                        .font(.largeTitle)
                        .bold()
                    
                    Text("Country: \(details.strArea)")
                        .font(.callout)
                    
                    fetchImage(by: details.strMealThumb, false)
                    
                    Divider()
                        .frame(height: 3)
                    
                    Text("Ingredient")
                        .font(.title2)
                        .bold()
                    
                    ForEach(0..<details.ingredients.count, id:\.self){ i in
                        HStack{
                            Text(details.ingredients[i])
                            Spacer()
                            Text(details.measurements[i])
                                .font(.caption)
                            
                        }
                        .padding(.vertical, 2)
                        
                    }
                    
                    Divider()
                    
                    Text("Instruction")
                        .font(.title2)
                        .bold()
                    
                    
                    let steps = splitInstructions(instruction: details.strInstructions, separator: ".")
                    ForEach(steps.indices, id: \.self) { index in
                        HStack(alignment: .top) {
                            Text("\(index + 1).")
                                .bold()
                            Text(steps[index])
                        }
                        .padding(.vertical, 2)
                    }
                    
                    Divider()
                    
                    Text("Tags")
                        .font(.title2)
                        .bold()
                    
                    
                    if let tags = details.strTags{
                        let tagList = splitInstructions(instruction: tags, separator: ",")
                        
                        TagCloudView(tags: tagList)
                    }
                    else{
                        Text("NO TAGS AVAILABLE NOW")
                            .padding()
                    }
                }
            }
        }
        .padding()
        .onAppear{
            detailViewModel.meal_id = id
            detailViewModel.fetchMealDetail()
        }
    }
    
    
    
}


