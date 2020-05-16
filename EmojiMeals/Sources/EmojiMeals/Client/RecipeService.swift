//
//  File.swift
//  
//
//  Created by Mat Schmid on 2020-05-11.
//

import Foundation

struct Recipee: Decodable {
	var recipe: [String: String]
}

enum RecipeService {
	static let recipeEndpoint = URL(string: "https://raw.githubusercontent.com/EmojiMeals/recipes/master/recipes.json")!
	
	enum ServiceError: Error {
		case error(String)
		
		var localizedDescription: String {
			switch self {
			case .error(let message):
				return message
			}
		}
	}
	
	static func get(completion: @escaping ((Result<[Recipe], ServiceError>) -> Void)) {
		let endpoint = RecipeService.recipeEndpoint
		URLSession.shared.dataTask(with: endpoint) { data, response, possibleError in
			if let error = possibleError {
				let errorMessage = """
					Received error when requesting recipes.
					Error: \(error.localizedDescription)
					URL: \(endpoint)
					Response: \(String(describing: response))
				"""
				return completion(.failure(.error(errorMessage)))
			}
			
			guard let data = data else {
				return completion(.failure(.error("No data received in response")))
			}
			
			var recipes: [Recipe] = []
			do {
				guard let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: String] else {
					return completion(.failure(.error("Unable to serialize JSON response")))
				}
				
				for (key, value) in json {
					let recipe = Recipe(ingredients: key.map { String($0) }, meal: value)
					recipes.append(recipe)
				}
			} catch {
				let errorMessage = """
					Unable to serialize JSON response.
					Error: \(error.localizedDescription)
					URL: \(endpoint)
					Response: \(String(describing: response))
				"""
				return completion(.failure(.error(errorMessage)))
			}
			completion(.success(recipes))
		}.resume()
	}
}
