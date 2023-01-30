//
//  RecipeTabView.swift
//  RecipeListApp
//
//  Created by Joshua Wright on 30/01/2023.
//

import SwiftUI

struct RecipeTabView: View {
    var body: some View {
        TabView{
            Text("Featured View")
                .tabItem{
                    VStack{
                        Image(systemName: "star.fill")
                        Text("Featured")
                    }
                    
                }
            RecipeView()
                .tabItem{
                    VStack{
                        Image(systemName: "list.bullet")
                        Text("Recipe List")
                    }
                }
        }
    }
}
    struct RecipeTabView_Previews: PreviewProvider {
        static var previews: some View {
            RecipeTabView()
        }
    }

