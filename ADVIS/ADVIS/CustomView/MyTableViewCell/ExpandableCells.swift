//
//  ExpandableCells.swift
//  ADVIS
//
//  Created by Tatsumi Nishida on 2018/08/18.
//  Copyright © 2018年 Tatsumi Nishida. All rights reserved.
//

import ExpandableCell
import Foundation

class NormalCell: UITableViewCell {
    static let ID = "NormalCell"
}

class ExpandableCell2: ExpandableCell {
    static let ID = "ExpandableCell"

    @IBOutlet var sectionLabel: UILabel!
}

class ExpandedCell: UITableViewCell {
    static let ID = "ExpandedCell"

    @IBOutlet var titleLabel: UILabel!
}
