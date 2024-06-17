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
func fetchImage(by url: String, _ shouldFrame: Bool) -> some View{
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
    .frame(width: shouldFrame ? 100 : nil, height: shouldFrame ? 100 : nil)
    .aspectRatio(contentMode: .fit)
    .padding(.trailing)
}
