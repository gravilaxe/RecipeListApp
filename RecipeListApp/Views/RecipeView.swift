//
//  ContentView.swift
//  RecipeListApp
//
//  Created by Joshua Wright on 25/01/2023.
//

import SwiftUI

struct RecipeView: View {
    
    @EnvironmentObject var model:RecipeModel
    
    var body: some View {
        
        
        NavigationView{
            VStack(alignment: .leading) {
                Text("All Recipes")
                    
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                ScrollView {
                    LazyVStack(alignment: .leading){
                        ForEach(model.recipes){ r in
                            
                            NavigationLink(
                                destination: DetailView(recipe:r),
                                label: {
                                    HStack(spacing: 20.0){
                                        Image(r.image)
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 50, height: 50)
                                            .clipped()
                                            .cornerRadius(5)
                                        Text(r.name)
                                            .foregroundColor(.black)
                                    }
                                }
                                
                            )
                            
                        }
                    }
                }
                
            }.padding(.leading)
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeView()
            .environmentObject(RecipeModel())
    }
}
