//
//  MyTableViewCell.swift
//  ADVIS
//
//  Created by Tatsumi Nishida on 2018/08/16.
//  Copyright © 2018年 Tatsumi Nishida. All rights reserved.
//

import UIKit

final class MyTableViewCell: UITableViewCell {
    let label = UILabel()
    // @IBOutlet weak var label: UILabel!

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        contentView.addSubview(label)
        label.textColor = UIColor.red
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        label.frame = contentView.bounds
        label.frame.origin.x += 12
    }
}
