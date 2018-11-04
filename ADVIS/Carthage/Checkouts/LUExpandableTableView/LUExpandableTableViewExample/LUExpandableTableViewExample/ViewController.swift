//
//  ViewController.swift
//  LUExpandableTableViewExample
//
//  Created by Laurentiu Ungur on 21/11/2016.
//  Copyright © 2016 Laurentiu Ungur. All rights reserved.
//

import LUExpandableTableView
import UIKit

final class ViewController: UIViewController {
    // MARK: - Properties

    private let expandableTableView = LUExpandableTableView()

    private let cellReuseIdentifier = "MyCell"
    private let sectionHeaderReuseIdentifier = "MySectionHeader"

    // MARK: - ViewController

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(expandableTableView)

        expandableTableView.register(MyTableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        expandableTableView.register(UINib(nibName: "MyExpandableTableViewSectionHeader", bundle: Bundle.main), forHeaderFooterViewReuseIdentifier: sectionHeaderReuseIdentifier)

        expandableTableView.expandableTableViewDataSource = self
        expandableTableView.expandableTableViewDelegate = self
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        expandableTableView.frame = view.bounds
        expandableTableView.frame.origin.y += 20
    }
}

// MARK: - LUExpandableTableViewDataSource

extension ViewController: LUExpandableTableViewDataSource {
    func numberOfSections(in _: LUExpandableTableView) -> Int {
        return 42
    }

    func expandableTableView(_: LUExpandableTableView, numberOfRowsInSection _: Int) -> Int {
        return 3
    }

    func expandableTableView(_ expandableTableView: LUExpandableTableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = expandableTableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as? MyTableViewCell else {
            assertionFailure("Cell shouldn't be nil")
            return UITableViewCell()
        }

        cell.label.text = "Cell at row \(indexPath.row) section \(indexPath.section)"

        return cell
    }

    func expandableTableView(_ expandableTableView: LUExpandableTableView, sectionHeaderOfSection section: Int) -> LUExpandableTableViewSectionHeader {
        guard let sectionHeader = expandableTableView.dequeueReusableHeaderFooterView(withIdentifier: sectionHeaderReuseIdentifier) as? MyExpandableTableViewSectionHeader else {
            assertionFailure("Section header shouldn't be nil")
            return LUExpandableTableViewSectionHeader()
        }

        sectionHeader.label.text = "Section \(section)"

        return sectionHeader
    }
}

// MARK: - LUExpandableTableViewDelegate

extension ViewController: LUExpandableTableViewDelegate {
    func expandableTableView(_: LUExpandableTableView, heightForRowAt _: IndexPath) -> CGFloat {
        /// Returning `UITableViewAutomaticDimension` value on iOS 9 will cause reloading all cells due to an iOS 9 bug with automatic dimensions
        return 50
    }

    func expandableTableView(_: LUExpandableTableView, heightForHeaderInSection _: Int) -> CGFloat {
        /// Returning `UITableViewAutomaticDimension` value on iOS 9 will cause reloading all cells due to an iOS 9 bug with automatic dimensions
        return 69
    }

    // MARK: - Optional

    func expandableTableView(_: LUExpandableTableView, didSelectRowAt indexPath: IndexPath) {
        print("Did select cell at section \(indexPath.section) row \(indexPath.row)")
    }

    func expandableTableView(_: LUExpandableTableView, didSelectSectionHeader _: LUExpandableTableViewSectionHeader, atSection section: Int) {
        print("Did select section header at section \(section)")
    }

    func expandableTableView(_: LUExpandableTableView, willDisplay _: UITableViewCell, forRowAt indexPath: IndexPath) {
        print("Will display cell at section \(indexPath.section) row \(indexPath.row)")
    }

    func expandableTableView(_: LUExpandableTableView, willDisplaySectionHeader _: LUExpandableTableViewSectionHeader, forSection section: Int) {
        print("Will display section header for section \(section)")
    }
}
