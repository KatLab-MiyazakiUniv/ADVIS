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
    var resistorColorX: Double = 0
    var resistorColorY: Double = 0
    var colorCode1 = 0
    var colorCode2 = 0
    var colorCode3 = 0
    var colorCode4 = 0

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

    func resistorNumber(code1: Int, code2: Int, code3: Int, code4: Int) {
        colorCode1 = code1
        colorCode2 = code2
        colorCode3 = code3
        colorCode4 = code4
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

        /// 抵抗器本体を描画
        let resistorLine = UIBezierPath()

        if startX < endX && startY > endY || startX > endX && startY < endY {
            resistorLine.move(to: CGPoint(x: resistorLongX + resistorFirstX, y: resistorLongY - resistorFirstY))
            resistorLine.addLine(to: CGPoint(x: resistorLongX - resistorFirstX, y: resistorLongY + resistorFirstY))
        } else {
            resistorLine.move(to: CGPoint(x: resistorLongX - resistorFirstX, y: resistorLongY - resistorFirstY))
            resistorLine.addLine(to: CGPoint(x: resistorLongX + resistorFirstX, y: resistorLongY + resistorFirstY))
        }
        resistorLine.close()
        UIColor(red: 0.988, green: 0.886, blue: 0.769, alpha: 1.0).setStroke()
        resistorLine.lineWidth = 9
        resistorLine.stroke()

        // カラーコードの描画
        if colorCode1 != 0 || colorCode2 != 0 {
            resistorColorX = resistorFirstX / 4
            resistorColorY = resistorFirstY / 4
            print("\(resistorColorX), \(resistorColorY)")
            /// 第1カラーコード
            let resistorColor1 = UIBezierPath()

            if startX < endX && startY > endY || startX > endX && startY < endY {
                resistorColor1.move(to: CGPoint(x: resistorLongX + resistorFirstX - resistorColorX * 0, y: resistorLongY - resistorFirstY + resistorColorY * 0))
                resistorColor1.addLine(to: CGPoint(x: resistorLongX + resistorFirstX - resistorColorX * 1, y: resistorLongY - resistorFirstY + resistorColorY * 1))
            } else {
                resistorColor1.move(to: CGPoint(x: resistorLongX - resistorFirstX + resistorColorX * 0, y: resistorLongY - resistorFirstY + resistorColorY * 0))
                resistorColor1.addLine(to: CGPoint(x: resistorLongX - resistorFirstX + resistorColorX * 1, y: resistorLongY - resistorFirstY + resistorColorY * 1))
            }
            resistorColor1.close()
            self.resistorColor1(number: colorCode1)
            resistorColor1.lineWidth = 9
            resistorColor1.stroke()

            /// 第2カラーコード
            let resistorColor2 = UIBezierPath()
            if startX < endX && startY > endY || startX > endX && startY < endY {
                resistorColor2.move(to: CGPoint(x: resistorLongX + resistorFirstX - resistorColorX * 2, y: resistorLongY - resistorFirstY + resistorColorY * 2))
                resistorColor2.addLine(to: CGPoint(x: resistorLongX + resistorFirstX - resistorColorX * 3, y: resistorLongY - resistorFirstY + resistorColorY * 3))
            } else {
                resistorColor2.move(to: CGPoint(x: resistorLongX - resistorFirstX + resistorColorX * 2, y: resistorLongY - resistorFirstY + resistorColorY * 2))
                resistorColor2.addLine(to: CGPoint(x: resistorLongX - resistorFirstX + resistorColorX * 3, y: resistorLongY - resistorFirstY + resistorColorY * 3))
            }
            resistorColor2.close()
            self.resistorColor2(number: colorCode2)
            resistorColor2.lineWidth = 9
            resistorColor2.stroke()

            /// 第3カラーコード
            let resistorColor3 = UIBezierPath()
            if startX < endX && startY > endY || startX > endX && startY < endY {
                resistorColor3.move(to: CGPoint(x: resistorLongX + resistorFirstX - resistorColorX * 4, y: resistorLongY - resistorFirstY + resistorColorY * 4))
                resistorColor3.addLine(to: CGPoint(x: resistorLongX + resistorFirstX - resistorColorX * 5, y: resistorLongY - resistorFirstY + resistorColorY * 5))
            } else {
                resistorColor3.move(to: CGPoint(x: resistorLongX - resistorFirstX + resistorColorX * 4, y: resistorLongY - resistorFirstY + resistorColorY * 4))
                resistorColor3.addLine(to: CGPoint(x: resistorLongX - resistorFirstX + resistorColorX * 5, y: resistorLongY - resistorFirstY + resistorColorY * 5))
            }
            resistorColor3.close()
            self.resistorColor2(number: colorCode3)
            resistorColor3.lineWidth = 9
            resistorColor3.stroke()

            /// 第4カラーコード
            let resistorColor4 = UIBezierPath()
            if startX < endX && startY > endY || startX > endX && startY < endY {
                resistorColor4.move(to: CGPoint(x: resistorLongX + resistorFirstX - resistorColorX * 6, y: resistorLongY - resistorFirstY + resistorColorY * 6))
                resistorColor4.addLine(to: CGPoint(x: resistorLongX + resistorFirstX - resistorColorX * 7, y: resistorLongY - resistorFirstY + resistorColorY * 7))
            } else {
                resistorColor4.move(to: CGPoint(x: resistorLongX - resistorFirstX + resistorColorX * 6, y: resistorLongY - resistorFirstY + resistorColorY * 6))
                resistorColor4.addLine(to: CGPoint(x: resistorLongX - resistorFirstX + resistorColorX * 7, y: resistorLongY - resistorFirstY + resistorColorY * 7))
            }
            resistorColor4.close()
            self.resistorColor3(number: colorCode4)
            resistorColor4.lineWidth = 9
            resistorColor4.stroke()
        } else {
            resistorColorX = resistorFirstX / 3
            resistorColorY = resistorFirstY / 3

            /// 0Ω抵抗のカラーコード
            let resistorColor1 = UIBezierPath()
            if startX < endX && startY > endY || startX > endX && startY < endY {
                resistorColor1.move(to: CGPoint(x: resistorLongX + resistorFirstX - resistorColorX * 2, y: resistorLongY - resistorFirstY + resistorColorY * 2))
                resistorColor1.addLine(to: CGPoint(x: resistorLongX + resistorFirstX - resistorColorX * 2, y: resistorLongY - resistorFirstY + resistorColorY * 2))
            } else {
                resistorColor1.move(to: CGPoint(x: resistorLongX - resistorFirstX + resistorColorX * 2, y: resistorLongY - resistorFirstY + resistorColorY * 2))
                resistorColor1.addLine(to: CGPoint(x: resistorLongX - resistorFirstX + resistorColorX * 2, y: resistorLongY - resistorFirstY + resistorColorY * 2))
            }
            resistorColor1.close()
            UIColor.black.setStroke()
            resistorColor1.lineWidth = 9
            resistorColor1.stroke()
        }
    }

    func resistorColor1(number: Int) {
        switch number {
        case 0:
            UIColor.black.setStroke()
        case 1:
            UIColor.brown.setStroke()
        case 2:
            UIColor.red.setStroke()
        case 3:
            UIColor.orange.setStroke()
        case 4:
            UIColor.yellow.setStroke()
        case 5:
            UIColor.green.setStroke()
        case 6:
            UIColor.blue.setStroke()
        case 7:
            UIColor.purple.setStroke()
        case 8:
            UIColor.gray.setStroke()
        case 9:
            UIColor.white.setStroke()
        default:
            UIColor.black.setStroke()
        }
    }

    func resistorColor2(number: Int) {
        switch number {
        case -2:
            UIColor(red: 0.753, green: 0.753, blue: 0.753, alpha: 1.0).setStroke()
        case -1:
            UIColor(red: 1.0, green: 0.843, blue: 0, alpha: 1.0).setStroke()
        case 0:
            UIColor.black.setStroke()
        case 1:
            UIColor.brown.setStroke()
        case 2:
            UIColor.red.setStroke()
        case 3:
            UIColor.orange.setStroke()
        case 4:
            UIColor.yellow.setStroke()
        case 5:
            UIColor.green.setStroke()
        case 6:
            UIColor.blue.setStroke()
        case 7:
            UIColor.purple.setStroke()
        case 8:
            UIColor.gray.setStroke()
        case 9:
            UIColor.white.setStroke()
        default:
            UIColor.black.setStroke()
        }
    }

    func resistorColor3(number: Int) {
        switch number {
        case 1:
            UIColor.brown.setStroke()
        case 2:
            UIColor.red.setStroke()
        case 5:
            UIColor(red: 1.0, green: 0.843, blue: 0, alpha: 1.0).setStroke()
        case 10:
            UIColor(red: 0.753, green: 0.753, blue: 0.753, alpha: 1.0).setStroke()
        case 20:
            UIColor.clear.setStroke()
        default:
            UIColor.black.setStroke()
        }
    }
}
