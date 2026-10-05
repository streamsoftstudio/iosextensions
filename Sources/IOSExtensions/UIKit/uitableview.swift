//
//  uitableview.swift
//  IOSExtensions
//
//  Created by Andrija Milovanovic on 4.10.2026.
//

#if canImport(UIKit)
import UIKit

public extension UITableView {
    /// Sizes `tableHeaderView` to fit the table's width, for a header laid
    /// out with Auto Layout. A table does not size its header itself, so call
    /// this from `viewDidLayoutSubviews`; it does nothing when the header
    /// already has the right size.
    func sizeHeaderToFit() {
        guard let header = tableHeaderView else { return }
        let fitting = header.systemLayoutSizeFitting(
            CGSize(width: bounds.width, height: UIView.layoutFittingCompressedSize.height),
            withHorizontalFittingPriority: .required,
            verticalFittingPriority: .fittingSizeLevel
        )
        let size = CGSize(width: bounds.width, height: ceil(fitting.height))
        guard header.frame.size != size else { return }
        header.frame = CGRect(origin: .zero, size: size)
        // Setting the header again is what makes the table lay out its rows
        // below the header's new height.
        tableHeaderView = header
    }
}
#endif
