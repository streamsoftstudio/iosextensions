import XCTest
@testable import IOSExtensions

final class DataTests: XCTestCase {
    func testHexadecimalString() {
        let data = Data([0x00, 0x0F, 0xAB, 0xFF])
        XCTAssertEqual(data.hexadecimalString, "000FABFF")
    }

    func testBytes() {
        XCTAssertEqual(Data([1, 2, 3]).bytes, [1, 2, 3])
    }

    func testBytesFromIndex() {
        XCTAssertEqual(Data([1, 2, 3, 4]).bytes(from: 2), [3, 4])
    }

    func testChunks() {
        let chunks = Data([1, 2, 3, 4, 5]).chunks(into: 2)
        XCTAssertEqual(chunks.map { $0.bytes }, [[1, 2], [3, 4], [5]])
    }

    func testCRC32MatchesStandardCheckValue() {
        // The canonical CRC-32 check value for the ASCII string "123456789".
        XCTAssertEqual(Data("123456789".utf8).crc, 0xCBF4_3926)
    }
}
