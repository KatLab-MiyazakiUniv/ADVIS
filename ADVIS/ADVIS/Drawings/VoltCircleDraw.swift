//
//  VoltCircleDraw.swift
//  ADVIS
//
//  Created by Tatsumi Nishida on 8/26/18.
//  Copyright © 2018 Tatsumi. All rights reserved.
//

import Foundation

class VoltCircleDraw: UIView {
    var startX: CGFloat = 0
    var startY: CGFloat = 0

    func intoBoardPoint(startX: CGFloat, startY: CGFloat) {
        self.startX = startX
        self.startY = startY
    }

    override func draw(_: CGRect) {
        let voltCircle = UIBezierPath(ovalIn: CGRect(x: startY, y: startY, width: 25, height: 25))
        voltCircle.lineWidth = 4
        UIColor.white.setFill()
        voltCircle.fill()
        UIColor.yellow.setStroke()
        voltCircle.stroke()
    }
}
