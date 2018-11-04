//
//  LineDraw.swift
//  ADVIS
//
//  Created by Tatsumi Nishida on 8/23/18.
//  Copyright © 2018 Tatsumi. All rights reserved.
//

import Foundation

class LineDraw: UIView {
    var startX: CGFloat = 0
    var startY: CGFloat = 0
    var endX: CGFloat = 0
    var endY: CGFloat = 0

    func intoBoardPoint(startX: CGFloat, startY: CGFloat, endX: CGFloat, endY: CGFloat) {
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
