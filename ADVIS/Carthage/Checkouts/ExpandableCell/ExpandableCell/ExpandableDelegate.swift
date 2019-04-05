//
//  ExpandableCellDelegate.swift
//  ExpandableCell
//
//  Created by Seungyoun Yi on 2017. 8. 7..
//  Copyright © 2017년 SeungyounYi. All rights reserved.
//

import UIKit

public protocol ExpandableDelegate: UIScrollViewDelegate {
    // MARK: Required Methods

    func expandableTableView(_ expandableTableView: ExpandableTableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell

    func expandableTableView(_ expandableTableView: ExpandableTableView, numberOfRowsInSection section: Int) -> Int

    func expandableTableView(_ expandableTableView: ExpandableTableView, heightForRowAt indexPath: IndexPath) -> CGFloat

    func expandableTableView(_ expandableTableView: ExpandableTableView, expandedCellsForRowAt indexPath: IndexPath) -> [UITableViewCell]?

    func expandableTableView(_ expandableTableView: ExpandableTableView, heightsForExpandedRowAt indexPath: IndexPath) -> [CGFloat]?

    // MARK: Optional Methods

    func expandableTableView(_ expandableTableView: ExpandableTableView, didSelectRowAt indexPath: IndexPath)

    func expandableTableView(_ expandableTableView: ExpandableTableView, didSelectExpandedRowAt indexPath: IndexPath)

    func expandableTableView(_ expandableTableView: ExpandableTableView, expandedCell: UITableViewCell, didSelectExpandedRowAt indexPath: IndexPath)

    func expandableTableView(_ expandableTableView: ExpandableTableView, titleForHeaderInSection section: Int) -> String?

    func expandableTableView(_ expandableTableView: ExpandableTableView, heightForHeaderInSection section: Int) -> CGFloat

    func expandableTableView(_ expandableTableView: ExpandableTableView, viewForHeaderInSection section: Int) -> UIView?

    func expandableTableView(_ expandableTableView: ExpandableTableView, heightForFooterInSection section: Int) -> CGFloat

    func expandableTableView(_ expandableTableView: ExpandableTableView, viewForFooterInSection section: Int) -> UIView?

    func expandableTableView(_ expandableTableView: ExpandableTableView, titleForFooterInSection section: Int) -> String?

    func numberOfSections(in expandableTableView: ExpandableTableView) -> Int

    func expandableTableView(_ expandableTableView: ExpandableTableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath)

    func expandableTableView(_ expandableTableView: ExpandableTableView, didEndDisplaying cell: UITableViewCell, forRow indexPath: IndexPath)

    func expandableTableView(_ expandableTableView: ExpandableTableView, willDisplayHeaderView view: UIView, forSection section: Int)

    func expandableTableView(_ expandableTableView: ExpandableTableView, willDisplayFooterView view: UIView, forSection section: Int)

    func expandableTableView(_ expandableTableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool

    func expandableTableView(_ expandableTableView: UITableView, didHighlightRowAt indexPath: IndexPath)

    func expandableTableView(_ expandableTableView: UITableView, didUnhighlightRowAt indexPath: IndexPath)

    func expandableTableView(_ expandableTableView: UITableView, didCloseRowAt indexPath: IndexPath)
}

public extension ExpandableDelegate {
    func expandableTableView(_: ExpandableTableView, didSelectRowAt _: IndexPath) {}

    func expandableTableView(_: ExpandableTableView, didSelectExpandedRowAt _: IndexPath) {}

    func expandableTableView(_: ExpandableTableView, expandedCell _: UITableViewCell, didSelectExpandedRowAt _: IndexPath) {}

    func expandableTableView(_: ExpandableTableView, titleForHeaderInSection _: Int) -> String? { return nil }

    func expandableTableView(_: ExpandableTableView, heightForHeaderInSection _: Int) -> CGFloat { return 0 }

    func expandableTableView(_: ExpandableTableView, viewForHeaderInSection _: Int) -> UIView? { return nil }

    func expandableTableView(_: ExpandableTableView, heightForFooterInSection _: Int) -> CGFloat {
        return 0
    }

    func expandableTableView(_: ExpandableTableView, viewForFooterInSection _: Int) -> UIView? {
        return nil
    }

    func expandableTableView(_: ExpandableTableView, titleForFooterInSection _: Int) -> String? {
        return nil
    }
    func numberOfSections(in _: ExpandableTableView) -> Int { return 1 }

    func expandableTableView(_: ExpandableTableView, willDisplay _: UITableViewCell, forRowAt _: IndexPath) {}

    func expandableTableView(_: ExpandableTableView, didEndDisplaying _: UITableViewCell, forRow _: IndexPath) {}

    func expandableTableView(_: ExpandableTableView, willDisplayHeaderView _: UIView, forSection _: Int) {}

    func expandableTableView(_: ExpandableTableView, willDisplayFooterView _: UIView, forSection _: Int) {}

    func expandableTableView(_: UITableView, shouldHighlightRowAt _: IndexPath) -> Bool { return false }

    func expandableTableView(_: UITableView, didHighlightRowAt _: IndexPath) {}

    func expandableTableView(_: UITableView, didUnhighlightRowAt _: IndexPath) {}
    func expandableTableView(_: UITableView, didCloseRowAt _: IndexPath) {}
}
