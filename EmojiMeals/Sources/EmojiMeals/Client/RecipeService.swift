//
//  File.swift
//  
//
//  Created by Mat Schmid on 2020-05-11.
//

import Foundation

enum RecipeService {
	static let recipeEndpoint = URL(string: "https://raw.githubusercontent.com/EmojiMeals/recipes/master/recipes.json")!
	
	static func get(completion: @escaping ((Result<[Recipe], Error>) -> Void)) {
		// TODO
	}
}
