//
//  recipeModel.swift
//  RecipeListApp
//
//  Created by Joshua Wright on 25/01/2023.
//

import Foundation

class RecipeModel: ObservableObject {
    
    @Published var recipes = [recipe]()
    
    init(){
        //Create Dataservice object
        self.recipes = DataService().getLocalData()
        
        
    }
}
