//
//  ResitorDraw.swift
//  ADVIS
//
//  Created by Tatsumi Nishida on 8/25/18.
//  Copyright © 2018 Tatsumi. All rights reserved.
//

import Foundation
import UIKit

class ResitorDraw: UIView {
    var startX: CGFloat = 0
    var startY: CGFloat = 0
    var endX: CGFloat = 0
    var endY: CGFloat = 0
    var resistorLongX: CGFloat = 0
    var resistorLongY: CGFloat = 0
    var resistorFirstX: CGFloat = 0
    var resistorFirstY: CGFloat = 0
    var resistorLengthX: CGFloat = 0
    var resistorLengthY: CGFloat = 0

    func intoBoardPoint(startX: CGFloat, startY: CGFloat, endX: CGFloat, endY: CGFloat) {
        self.startX = startX
        self.startY = startY
        self.endX = endX
        self.endY = endY
    }

    override func draw(_: CGRect) {
        // 平方根
        resistorLengthX = abs(startX - endX)
        resistorLengthY = abs(startY - endY)

        if resistorLengthX == 0 {
            resistorFirstY = 20
        } else if resistorLengthY == 0 {
            resistorFirstX = 20
        } else if resistorLengthX == resistorLengthY {
            resistorFirstX = 5
            resistorFirstY = 5
        } else {
            resistorFirstX = abs(startX - endX) / 8
            resistorFirstY = abs(startY - endY) / 8
        }

        let line = UIBezierPath()
        // 起点
        line.move(to: CGPoint(x: startX, y: startY))
        // 終点
        line.addLine(to: CGPoint(x: endX, y: endY))
        line.close()
        // 色の設定
        UIColor.lightGray.setFill()
        UIColor.black.setStroke()
        // ライン幅
        line.lineWidth = 3
        // 描画
        line.stroke()
        // 抵抗部分の描画
        if startX > endX {
            resistorLongX = abs(startX - endX) / 2 + endX
        } else if startX < endX {
            resistorLongX = abs(startX - endX) / 2 + startX
        } else if startX == endX {
            resistorLongX = startX
        }
        if startY > endY {
            resistorLongY = abs(startY - endY) / 2 + endY
        } else if startY < endY {
            resistorLongY = abs(startY - endY) / 2 + startY
        } else if startY == endY {
            resistorLongY = startY
        }
        let resistorLine = UIBezierPath()

        if startX < endX && startY > endY || startX > endX && startY < endY {
            resistorLine.move(to: CGPoint(x: resistorLongX + resistorFirstX, y: resistorLongY - resistorFirstY))
            resistorLine.addLine(to: CGPoint(x: resistorLongX - resistorFirstX, y: resistorLongY + resistorFirstY))
        } else {
            resistorLine.move(to: CGPoint(x: resistorLongX - resistorFirstX, y: resistorLongY - resistorFirstY))
            resistorLine.addLine(to: CGPoint(x: resistorLongX + resistorFirstX, y: resistorLongY + resistorFirstY))
        }
        resistorLine.close()
        UIColor.brown.setStroke()
        resistorLine.lineWidth = 9
        resistorLine.stroke()
    }
}
