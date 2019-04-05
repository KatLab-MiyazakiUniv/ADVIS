//
//  MyTableViewSectionHeader.swift
//  ADVIS
//
//  Created by Tatsumi Nishida on 2018/08/16.
//  Copyright © 2018年 Tatsumi Nishida. All rights reserved.
//

import LUExpandableTableView
// import LUExpandableTableView
import UIKit

class MyTableViewSectionHeader: LUExpandableTableViewSectionHeader {
    @IBOutlet var tableViewButton: UIButton!
//    @IBOutlet weak var label: UILabel!

    override var isExpanded: Bool {
        didSet {
            // Change the title of the button when section header expand/collapse
            // If you want to change when tpped button ↓
            //tableViewButton?.setTitle(isExpanded ? "Collapse" : "Expand", for: .normal)
        }
    }

    @IBAction func expandCollapse(_: UIButton) {
        delegate?.expandableSectionHeader(self, shouldExpandOrCollapseAtSection: section)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
//        label?.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTapOnLabel)))
//        label?.isUserInteractionEnabled = true
    }

    @objc private func didTapOnLabel(_: UIGestureRecognizer) {
        // Send the message to his delegate that was selected
        delegate?.expandableSectionHeader(self, wasSelectedAtSection: section)
    }
}
