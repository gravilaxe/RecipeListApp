//
//  recipe.swift
//  RecipeListApp
//
//  Created by Joshua Wright on 25/01/2023.
//

import Foundation

class recipe: Identifiable, Decodable {
    var id:UUID?
    var name:String
    var featured:Bool
    var image:String
    var description:String
    var prepTime:String
    var cookTime:String
    var totalTime:String
    var servings:Int
    var highlights:[String]
    var ingredients:[ingredients]
    var directions:[String]
}

class ingredients: Identifiable, Decodable {
    var id:UUID?
    var name:String
    var numerator:Int?
    var denominator:Int?
    var unit:String?
    
    
}
