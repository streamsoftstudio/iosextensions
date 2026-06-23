import XCTest
@testable import IOSExtensions

private struct Sample: Codable, Equatable {
    let id: Int
    let name: String
}

final class CodableTests: XCTestCase {
    private let sample = Sample(id: 7, name: "streamsoft")

    func testEncodeDecodeDataRoundTrip() throws {
        let data = try sample.encodedJSON()
        let decoded = try Sample.decoded(from: data)
        XCTAssertEqual(decoded, sample)
    }

    func testJSONStringRoundTrip() throws {
        let json = try XCTUnwrap(sample.jsonString)
        XCTAssertEqual(Sample.decoded(from: json), sample)
    }

    func testDictionaryRepresentation() throws {
        let dict = try XCTUnwrap(sample.dictionary)
        XCTAssertEqual(dict["id"] as? Int, 7)
        XCTAssertEqual(dict["name"] as? String, "streamsoft")
    }

    func testDictionaryDecodedToModel() {
        let dict: [String: Any] = ["id": 7, "name": "streamsoft"]
        let decoded: Sample? = dict.decoded()
        XCTAssertEqual(decoded, sample)
    }

    func testDecodedFromInvalidStringReturnsNil() {
        XCTAssertNil(Sample.decoded(from: "not json"))
    }
}
