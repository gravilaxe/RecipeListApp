//
//  DataService.swift
//  RecipeListApp
//
//  Created by Joshua Wright on 25/01/2023.
//

import Foundation

class DataService{
    
    func getLocalData() -> [recipe] {
        //Parse local json
        
        //Get URL path to json file
        
        let pathString = Bundle.main.path(forResource: "recipes", ofType: "json")
        
        //Check pathstring not nil,  return empty recipe list if nil
        guard pathString != nil else{
            return [recipe]()
            
        }
        //Create URL Object
        let url = URL(fileURLWithPath: pathString!)
        
        do {
            let data = try Data(contentsOf: url) //Create data object
            //Decode Data with decoder
            let decoder = JSONDecoder()
            
            do {
                let recipeData = try decoder.decode([recipe].self, from: data)
                //Add UUID to recipes
                for r in recipeData{
                    r.id = UUID()
                    //Add unique IDs to ingredients of recipe   
                    for i in r.ingredients{
                        i.id = UUID()
                    }
                }
                return recipeData
            }
            
            catch{
                print("Error with parsion JSON")
            }
           
            
        }
        catch{
            print("Error creating data object")
        }
        return [recipe]()
    }
    
}
