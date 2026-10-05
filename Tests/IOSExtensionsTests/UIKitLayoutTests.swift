#if canImport(UIKit)
import UIKit
import XCTest
@testable import IOSExtensions

final class UIKitLayoutTests: XCTestCase {

    func testATableHeaderIsSizedToItsContentAtTheTablesWidth() {
        let table = UITableView(frame: CGRect(x: 0, y: 0, width: 320, height: 600))
        let header = UIView()
        let content = UIView()
        content.translatesAutoresizingMaskIntoConstraints = false
        header.addSubview(content)
        NSLayoutConstraint.activate([
            content.leadingAnchor.constraint(equalTo: header.leadingAnchor),
            content.trailingAnchor.constraint(equalTo: header.trailingAnchor),
            content.topAnchor.constraint(equalTo: header.topAnchor, constant: 10),
            content.bottomAnchor.constraint(equalTo: header.bottomAnchor, constant: -10),
            content.heightAnchor.constraint(equalToConstant: 80),
        ])
        table.tableHeaderView = header

        table.sizeHeaderToFit()

        XCTAssertEqual(table.tableHeaderView?.frame.size, CGSize(width: 320, height: 100))
    }

    func testATableWithoutAHeaderIsLeftAlone() {
        let table = UITableView(frame: CGRect(x: 0, y: 0, width: 320, height: 600))

        table.sizeHeaderToFit()

        XCTAssertNil(table.tableHeaderView)
    }
}
#endif
