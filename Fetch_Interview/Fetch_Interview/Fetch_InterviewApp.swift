//
//  Fetch_InterviewApp.swift
//  Fetch_Interview
//
//  Created by Ting Qu on 6/14/24.
//

import SwiftUI

@main
struct Fetch_InterviewApp: App {
    var body: some Scene {
        WindowGroup {
            MainPage()
        }
    }
}

// global function
func fetchImage(by url: String ) -> some View{
    AsyncImage(url: URL(string: url)) { phase in
        switch phase {
        case .failure:
            Image(systemName: "photo")
                .font(.largeTitle)
        case .success(let image):
            image
                .resizable()
            
        default:
            ProgressView()
        }
    }
    .frame(width:100,height: 100)
    .padding(.trailing)
}
