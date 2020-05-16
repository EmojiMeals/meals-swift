import Foundation

class EmojiMeals {
	var recipes: [Recipe] = []
	
	init(fetchRemoteRecipes: Bool = true) {
		if fetchRemoteRecipes {
			loadRecipes()
		}
	}
	
	func mealify(_ ingredients: String...) -> String {
		for recipe in recipes {
			if ingredients.sorted() == recipe.ingredients.sorted() {
				return recipe.meal
			}
		}
		return ingredients.joined()
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
