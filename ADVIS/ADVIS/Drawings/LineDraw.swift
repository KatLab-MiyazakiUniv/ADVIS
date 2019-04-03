//
//  LineDraw.swift
//  ADVIS
//
//  Created by Tatsumi Nishida on 8/23/18.
//  Copyright © 2018 Tatsumi. All rights reserved.
//

import Foundation
import UIKit

class LineDraw: UIView {
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
        // make instance
        let line = UIBezierPath()
        // starting point
        line.move(to: CGPoint(x: startX, y: startY))
        // end point
        line.addLine(to: CGPoint(x: endX, y: endY))
        line.close()
        // line color
        UIColor.blue.setStroke()
        // line width
        line.lineWidth = 5
        // draw
        line.stroke()
    }
}
