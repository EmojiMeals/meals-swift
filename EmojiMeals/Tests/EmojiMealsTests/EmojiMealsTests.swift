import XCTest
@testable import EmojiMeals

final class EmojiMealsTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(EmojiMeals().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
