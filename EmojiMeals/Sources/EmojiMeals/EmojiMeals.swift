import Foundation

class EmojiMeals {
	var recipes: [Recipe] = []
	
	func mealify(_ ingredients: String...) -> String {
		// TODO: Add business logic
		return ""
	}
	
	func loadRecipes() {
		RecipeService.get { [weak self] result in
			switch result {
			case .failure(let error):
				print(error)
			case .success(let recipes):
				self?.recipes = recipes
			}
		}
	}
}
