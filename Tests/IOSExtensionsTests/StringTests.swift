import XCTest
@testable import IOSExtensions

final class StringTests: XCTestCase {
    func testValidURLs() {
        XCTAssertTrue("https://www.streamsoft.rs".isValidURL)
        XCTAssertTrue("http://example.com/path?q=1".isValidURL)
    }

    func testInvalidURLs() {
        XCTAssertFalse("just some text".isValidURL)
        XCTAssertFalse("".isValidURL)
        // A URL embedded in other text doesn't cover the whole string.
        XCTAssertFalse("see https://example.com now".isValidURL)
    }
}
