import XCTest
@testable import IOSExtensions

final class DateTests: XCTestCase {
    private func makeDate(year: Int, month: Int, day: Int, hour: Int = 0, minute: Int = 0) -> Date {
        var components = DateComponents()
        components.year = year
        components.month = month
        components.day = day
        components.hour = hour
        components.minute = minute
        return Calendar.current.date(from: components)!
    }

    func testComponentAccessors() {
        let date = makeDate(year: 2026, month: 6, day: 23, hour: 14, minute: 30)
        XCTAssertEqual(date.year, 2026)
        XCTAssertEqual(date.month, 6)
        XCTAssertEqual(date.day, 23)
        XCTAssertEqual(date.hour, 14)
        XCTAssertEqual(date.minute, 30)
    }

    func testSettingHourAndMinute() throws {
        let date = makeDate(year: 2026, month: 6, day: 23, hour: 9)
        let adjusted = try XCTUnwrap(date.setting(hour: 18, minute: 45))
        XCTAssertEqual(adjusted.year, 2026)
        XCTAssertEqual(adjusted.month, 6)
        XCTAssertEqual(adjusted.day, 23)
        XCTAssertEqual(adjusted.hour, 18)
        XCTAssertEqual(adjusted.minute, 45)
    }
}
