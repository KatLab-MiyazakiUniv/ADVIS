//
//  CustomMenuButton.swift
//  ADVIS
//
//  Created by Tatsumi Nishida on 2018/08/17.
//  Copyright © 2018年 Tatsumi Nishida. All rights reserved.
//

import Foundation
import UIKit

class CustomMenuButton: UIButton {
    override func awakeFromNib() {
        super.awakeFromNib()

        setTitleColor(.white, for: .normal)
        setTitleColor(.darkGray, for: [.selected, .highlighted])
        setTitleColor(.black, for: .selected)
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        tintColor = .clear
        layer.cornerRadius = frame.height / 2
        layer.borderColor = UIColor.white.cgColor
        layer.borderWidth = 2
    }

    override var isSelected: Bool {
        didSet {
            updateBackgroundColor()
        }
    }

    override var isHighlighted: Bool {
        didSet {
            updateBackgroundColor()
        }
    }

    fileprivate func updateBackgroundColor() {
        if !isSelected, !isHighlighted {
            backgroundColor = .clear
        } else if !isSelected, isHighlighted {
            backgroundColor = .lightGray
        } else {
            backgroundColor = .white
        }
    }
}
