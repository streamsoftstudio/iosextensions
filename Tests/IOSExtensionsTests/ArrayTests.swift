import XCTest
@testable import IOSExtensions

final class ArrayTests: XCTestCase {
    func testRemovingDuplicatesPreservesOrder() {
        XCTAssertEqual([1, 2, 2, 3, 1, 4].removingDuplicates(), [1, 2, 3, 4])
        XCTAssertEqual(["a", "a", "b"].removingDuplicates(), ["a", "b"])
    }

    func testRemovingDuplicatesOnEmptyArray() {
        XCTAssertEqual([Int]().removingDuplicates(), [])
    }

    func testRemoveDuplicatesMutatesInPlace() {
        var values = [3, 3, 1, 2, 1]
        values.removeDuplicates()
        XCTAssertEqual(values, [3, 1, 2])
    }
}
