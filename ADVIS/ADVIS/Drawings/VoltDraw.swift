//
//  VoltDraw.swift
//  ADVIS
//
//  Created by Tatsumi Nishida on 8/26/18.
//  Copyright © 2018 Tatsumi. All rights reserved.
//

import Foundation

class VoltDraw: UIView {
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
        let line = UIBezierPath()
        line.move(to: CGPoint(x: startX, y: startY))
        line.addLine(to: CGPoint(x: endX, y: endY))
        line.close()
        let voltColor = UIColor(red: 1, green: 1, blue: 0, alpha: 0.5)
        voltColor.setStroke()
        line.lineWidth = 5
        line.stroke()
    }
}
