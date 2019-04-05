//
//  jyroDraw.swift
//  ADVIS
//
//  Created by Tatsumi Nishida on 8/26/18.
//  Copyright © 2018 Tatsumi. All rights reserved.
//

import Foundation
import UIKit

class GyroDraw: UIView {
    /* 描画用の座標保持変数 */
    var x1: Double = 0
    var y1: Double = 0
    var x2: Double = 0
    var y2: Double = 0
    var x3: Double = 0
    var y3: Double = 0
    var x4: Double = 0
    var y4: Double = 0
    var x5: Double = 0
    var y5: Double = 0
    var x6: Double = 0
    var y6: Double = 0
    var x7: Double = 0
    var y7: Double = 0
    var x8: Double = 0
    var y8: Double = 0
    /* 中間管理職変数 */
    var gyroCenterX: Double = 0
    var gyroCenterY: Double = 0

    func intoBoardPoint(x1: Double, y1: Double, x2: Double, y2: Double, x3: Double, y3: Double, x4: Double, y4: Double) {
        self.x1 = x1
        self.y1 = y1
        self.x2 = x2
        self.y2 = y2
        self.x3 = x3
        self.y3 = y3
        self.x4 = x4
        self.y4 = y4
        x5 = x1
        y5 = y1 + 76
        x6 = x2
        y6 = y2 + 76
        x7 = x3
        y7 = y3 + 76
        x8 = x4
        y8 = y4 + 76

        gyroCenterX = abs(x3 - x2) / 2 + x2
        gyroCenterY = abs(y6 - y3) / 2 + y3
    }

    override func draw(_: CGRect) {
        let foundation = UIBezierPath(rect: CGRect(x: x1 - 19, y: y1 - 17, width: 125, height: 100))
        UIColor.green.setFill()
        foundation.fill()
        UIColor.green.setStroke()
        foundation.stroke()

        let circle1 = UIBezierPath(ovalIn: CGRect(x: x1 - 13, y: y1 - 8, width: 15, height: 15))
        circle1.lineWidth = 3
        UIColor.gray.setFill()
        circle1.fill()
        UIColor.white.setStroke()
        circle1.stroke()
        let circle2 = UIBezierPath(ovalIn: CGRect(x: x2 - 12, y: y2 - 8, width: 15, height: 15))
        circle2.lineWidth = 3
        UIColor.gray.setFill()
        circle2.fill()
        UIColor.white.setStroke()
        circle2.stroke()
        let circle3 = UIBezierPath(ovalIn: CGRect(x: x3 - 12, y: y3 - 8, width: 15, height: 15))
        circle3.lineWidth = 3
        UIColor.gray.setFill()
        circle3.fill()
        UIColor.white.setStroke()
        circle3.stroke()
        let circle4 = UIBezierPath(ovalIn: CGRect(x: x4 - 12, y: y4 - 8, width: 15, height: 15))
        circle4.lineWidth = 3
        UIColor.gray.setFill()
        circle4.fill()
        UIColor.white.setStroke()
        circle4.stroke()
        let circle5 = UIBezierPath(ovalIn: CGRect(x: x5 - 12, y: y5 - 8, width: 15, height: 15))
        circle5.lineWidth = 3
        UIColor.gray.setFill()
        circle5.fill()
        UIColor.white.setStroke()
        circle5.stroke()
        let circle6 = UIBezierPath(ovalIn: CGRect(x: x6 - 12, y: y6 - 8, width: 15, height: 15))
        circle6.lineWidth = 3
        UIColor.gray.setFill()
        circle6.fill()
        UIColor.white.setStroke()
        circle6.stroke()
        let circle7 = UIBezierPath(ovalIn: CGRect(x: x7 - 12, y: y7 - 8, width: 15, height: 15))
        circle7.lineWidth = 3
        UIColor.gray.setFill()
        circle7.fill()
        UIColor.white.setStroke()
        circle7.stroke()
        let circle8 = UIBezierPath(ovalIn: CGRect(x: x8 - 12, y: y8 - 8, width: 15, height: 15))
        circle8.lineWidth = 3
        UIColor.gray.setFill()
        circle8.fill()
        UIColor.white.setStroke()
        circle8.stroke()

        let centerCore = UIBezierPath(rect: CGRect(x: x2 - 8, y: y2 + 20, width: x3 - x2 + 11, height: gyroCenterY - y2))
        UIColor.black.setFill()
        centerCore.fill()
        centerCore.stroke()
    }
}
