//
//  DetailView.swift
//  RecipeListApp
//
//  Created by Joshua Wright on 25/01/2023.
//

import SwiftUI

struct DetailView: View {
    
    var recipe:recipe
    
    @State var selectedServingSize = 2
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading){
                
                //MARK: recipeImage
                Image(recipe.image)
                    .resizable()
                    .scaledToFill()
                
                //MARK: Recipe Title
                Text(recipe.name)
                    .bold()
                    .padding()
                    .font(.largeTitle)
                
                
                //MARK: Serving Size Picker
                VStack(alignment: .leading){
                    Text("Serving Size")
                    Picker("", selection: $selectedServingSize){
                        Text("2").tag(2)
                        Text("4").tag(4)
                        Text("6").tag(6)
                        Text("8").tag(8)
                    }.pickerStyle(.segmented)
                        .frame(width: 180)
                }.padding()
                    
                //MARK: ingredients
                VStack(alignment: .leading){
                    Text("Ingredients")
                        .font(.headline)
                        .padding(.bottom, 3.0)
                    
                    ForEach(recipe.ingredients){ item in
                        Text("- " + RecipeModel.getPortion(ingredient: item, recipeServings: recipe.servings, targetServings: selectedServingSize) + " \(item.name.lowercased())")
                            .padding([.leading, .bottom], 1.0)
                    }
                }
                .padding(.leading)
                Divider()
                //MARK: directions
                VStack(alignment: .leading){
                    Text("Directions")
                        .font(.headline)
                        .padding(.bottom, 3.0)
                    
                    ForEach(0..<recipe.directions.count, id: \.self){ index in
                        Text(String(index+1) + " " + recipe.directions[index])
                            .padding([.leading, .bottom], 3.0)
                    }
                }
                .padding(.leading)
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        
        //Create a dummy recipe
        
        let model = RecipeModel()
        DetailView(recipe: model.recipes[0])
    }
}
