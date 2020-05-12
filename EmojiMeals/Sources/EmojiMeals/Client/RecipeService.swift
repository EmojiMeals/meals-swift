//
//  File.swift
//  
//
//  Created by Mat Schmid on 2020-05-11.
//

import Foundation

enum RecipeService {
	
	enum ServiceError: Error {
		case error(String)
		
		var localizedDescription: String {
			switch self {
			case .error(let message):
				return message
			}
		}
	}
	
	static let recipeEndpoint = URL(string: "https://raw.githubusercontent.com/EmojiMeals/recipes/master/recipes.json")!
	
	static func get(completion: @escaping ((Result<[Recipe], ServiceError>) -> Void)) {
		let endpoint = RecipeService.recipeEndpoint
		print("Entering session")
		URLSession.shared.dataTask(with: endpoint) { data, response, possibleError in
			print("In session")
			if let data = data, let jsonString = String(data: data, encoding: .utf8) {
				print(jsonString)
			}
		}.resume()
	}
}

/*
if let error = possibleError {
	let errorMessage = """
		Received error when requesting recipes.
		Error: \(error.localizedDescription)
		URL: \(endpoint)
		Response: \(String(describing: response))
	"""
	return completion(.failure(.error(errorMessage)))
}

let decoder = JSONDecoder()
let recipes: [Recipe]

do {
	recipes = try decoder.decode([Recipe].self, from: data!)
} catch {
	let errorMessage = """
		Received error when decoding data.
		Error: \(error.localizedDescription)
		URL: \(endpoint)
		Response: \(String(describing: response))
	"""
	return completion(.failure(.error(errorMessage)))
}

return completion(.success(recipes))
*/
