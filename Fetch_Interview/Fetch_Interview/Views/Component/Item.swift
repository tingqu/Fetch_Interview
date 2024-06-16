//
//  Item.swift
//  Fetch_Interview
//
//  Created by Ting Qu on 6/14/24.
//

import SwiftUI

struct Item: View {
    var meals: Meal?
    var body: some View {
        NavigationLink(destination: DetailPage()) {
            HStack{
                fetchImage(by: "")
                VStack(alignment:.leading,spacing: 5){
                    Text("Apam balik")
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
        Item()
    }
}
