import XCTest
@testable import EmojiMeals

final class EmojiMealsTests: XCTestCase {
	func testService() {
		let expectation = XCTestExpectation(description: "Download emoji recipes from URL")
		RecipeService.get { result in
			print(result)
			expectation.fulfill()
		}
		wait(for: [expectation], timeout: 10.0)
	}
	
	func testMealify() {
		let meals = EmojiMeals(fetchRemoteRecipes: false)
		meals.recipes.append(Recipe(ingredients: ["🍞", "🍅", "🧀"], meal: "🍕"))
		
		XCTAssertEqual(meals.mealify("🍞", "🍅", "🧀"), "🍕")
		XCTAssertEqual(meals.mealify("🧀", "🍞", "🍅"), "🍕")
		XCTAssertEqual(meals.mealify("🍅", "🧀"), "🍅🧀")
		XCTAssertEqual(meals.mealify("Hello", "World"), "HelloWorld")
	}

	static var allTests = [
		("testService", testService),
	]
}
