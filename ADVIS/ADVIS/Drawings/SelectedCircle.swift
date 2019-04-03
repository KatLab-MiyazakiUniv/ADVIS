//
//  SelectedCircle.swift
//  ADVIS
//
//  Created by Tatsumi Nishida on 4/2/19.
//  Copyright © 2019 Tatsumi. All rights reserved.
//

import Foundation
import UIKit

class SelectedCircle: UIView {
    var startX: Double = 0
    var startY: Double = 0
    var endX: Double = 0
    var endY: Double = 0
    func intoBoardPoint(startX: Double, startY: Double) {
        self.startX = startX
        self.startY = startY
    }

    override func draw(_: CGRect) {
        // 選択されているところ
        let selectedCircle = UIBezierPath(arcCenter: CGPoint(x: startX, y: startY), radius: 10, startAngle: 0, endAngle: CGFloat(Double.pi) * 2, clockwise: true)
        selectedCircle.lineWidth = 3
        UIColor.purple.setFill()
        selectedCircle.fill()
        UIColor.purple.setStroke()
        selectedCircle.stroke()
    }
}
