# EmojiMeals

Find what you can cook with your emojis

Emoji recipes fetched from https://raw.githubusercontent.com/EmojiMeals/recipes/master/recipes.json

## Install using SwiftPM

```swift
.package(
	url: "https://github.com/schmidyy/meals-swift",
	.branch("master")
)
```

## Usage

```swift
let meals = EmojiMeals()
meals.mealify("🍞", "🍅", "🧀") // "🍕"

// Provide ingredients in any order

meals.mealify("🧀", "🍞", "🍅") // "🍕"

// Provide other recipes manually

meals.recipes.append(Recipe(ingredients: ["🍰", "🌚"], meal: "🥮"))
meals.mealify("🍰", "🌚") // "🥮"
````
