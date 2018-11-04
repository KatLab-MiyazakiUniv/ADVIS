//
//  MyExpandableTableViewSectionHeader.swift
//  LUExpandableTableViewExample
//
//  Created by Laurentiu Ungur on 24/11/2016.
//  Copyright © 2016 Laurentiu Ungur. All rights reserved.
//

import LUExpandableTableView
import UIKit

final class MyExpandableTableViewSectionHeader: LUExpandableTableViewSectionHeader {
    // MARK: - Properties

    @IBOutlet var expandCollapseButton: UIButton!
    @IBOutlet var label: UILabel!

    override var isExpanded: Bool {
        didSet {
            // Change the title of the button when section header expand/collapse
            expandCollapseButton?.setTitle(isExpanded ? "Collapse" : "Expand", for: .normal)
        }
    }

    // MARK: - Base Class Overrides

    override func awakeFromNib() {
        super.awakeFromNib()

        label?.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTapOnLabel)))
        label?.isUserInteractionEnabled = true
    }

    // MARK: - IBActions

    @IBAction func expandCollapse(_: UIButton) {
        // Send the message to his delegate that shold expand or collapse
        delegate?.expandableSectionHeader(self, shouldExpandOrCollapseAtSection: section)
    }

    // MARK: - Private Functions

    @objc private func didTapOnLabel(_: UIGestureRecognizer) {
        // Send the message to his delegate that was selected
        delegate?.expandableSectionHeader(self, wasSelectedAtSection: section)
    }
}
