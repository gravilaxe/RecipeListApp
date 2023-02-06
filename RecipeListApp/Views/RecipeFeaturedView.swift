//
//  RecipeFeaturedView.swift
//  RecipeListApp
//
//  Created by Joshua Wright on 01/02/2023.
//

import SwiftUI

struct RecipeFeaturedView: View {
    
    @EnvironmentObject var model:RecipeModel
    @State var tabSelectionIndex = 0
    @State var isDetailViewShowing = false
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 0) {
            
            Text("Featured Recipe")
                .padding(.leading)
                .font(.largeTitle)
                .fontWeight(.bold)
            GeometryReader { geo in
                TabView(selection: $tabSelectionIndex){
                    ForEach(0..<model.recipes.count, id:\.self){ index in
                        if model.recipes[index].featured {
                            Button{
                                self.isDetailViewShowing = true
                            } label: {
                                ZStack {
                                    Rectangle()
                                        .foregroundColor(.white)
                                    
                                    VStack(spacing: 0 ){
                                        Image(model.recipes[index].image)
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .clipped()
                                        Text(model.recipes[index].name)
                                            .padding(5)
                                            .foregroundColor(.black)
                                        
                                    }
                                }
                            }
                            .sheet(isPresented: $isDetailViewShowing){
                                DetailView(recipe: model.recipes[index])
                            }
                            .frame(width: geo.size.width-40, height: geo.size.height-100)
                                .cornerRadius(15)
                                .shadow(color: Color(.sRGB, red: 0, green: 0, blue: 0, opacity: 0.5), radius: 10, x:-5, y: 5)

                        }
                        
                        
                    }
                    
                    
                }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                    .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            }
            
            VStack(alignment: .leading, spacing: 10){
                Text("Preperation Time")
                    .font(.headline)
                Text(model.recipes[tabSelectionIndex].prepTime)
                Text("Highlights")
                    .font(.headline)
                //Text(model.recipes[tabSelectionIndex].highlights)
            }
            .padding([.leading, .bottom])
        }
        
        
        
    }
}

struct RecipeFeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeFeaturedView()
            .environmentObject(RecipeModel())
    }
}
