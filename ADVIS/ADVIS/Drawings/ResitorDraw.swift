//
//  ResitorDraw.swift
//  ADVIS
//
//  Created by Tatsumi Nishida on 8/25/18.
//  Copyright © 2018 Tatsumi. All rights reserved.
//

import Foundation
import UIKit

/// 抵抗器を描画するクラス
class ResitorDraw: UIView {
    var startX: Double = 0
    var startY: Double = 0
    var endX: Double = 0
    var endY: Double = 0
    var resistorLongX: Double = 0
    var resistorLongY: Double = 0
    var resistorFirstX: Double = 0
    var resistorFirstY: Double = 0
    var resistorLengthX: Double = 0
    var resistorLengthY: Double = 0

    /// 抵抗器を描画するための座標を設定
    ///
    /// - Parameters:
    ///   - startX: 起点のX座標
    ///   - startY: 起点のY座標
    ///   - endX: 終点のX座標
    ///   - endY: 終点のY座標
    ///
    /// メンバ変数にそれぞれ代入
    func intoBoardPoint(startX: Double, startY: Double, endX: Double, endY: Double) {
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
