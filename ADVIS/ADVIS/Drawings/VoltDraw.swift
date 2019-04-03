//
//  VoltDraw.swift
//  ADVIS
//
//  Created by Tatsumi Nishida on 8/26/18.
//  Copyright © 2018 Tatsumi. All rights reserved.
//

import Foundation
import UIKit

class VoltDraw: UIView {
    var startX: Double = 0
    var startY: Double = 0
    var endX: Double = 0
    var endY: Double = 0
    func intoBoardPoint(startX: Double, startY: Double, endX: Double, endY: Double) {
        self.startX = startX
        self.startY = startY
        self.endX = endX
        self.endY = endY
    }

    override func draw(_: CGRect) {
        let line = UIBezierPath()
        line.move(to: CGPoint(x: startX, y: startY))
        line.addLine(to: CGPoint(x: endX, y: endY))
        line.close()
        let voltColor = UIColor(red: 1, green: 1, blue: 0, alpha: 0.5)
        voltColor.setStroke()
        line.lineWidth = 5 // 線の太さ
        line.stroke()
    }
}
