//
//  AmpereDraw.swift
//  ADVIS
//
//  Created by Tatsumi Nishida on 4/16/19.
//  Copyright © 2019 Tatsumi. All rights reserved.
//

import Foundation
import UIKit

class AmpereDraw: UIView {
    var startX: Double = 0
    var startY: Double = 0
    var endX: Double = 0
    var endY: Double = 0

    /// 電流値を描画するための座標を設定
    ///
    /// - Parameters:
    ///   - startX: 起点のX座標
    ///   - startY: 起点のY座標
    ///   - endX: 終点のX座標
    ///   - endY: 週手のY座標
    ///
    /// メンバ変数にそれぞれ代入
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
        let ampereColor = UIColor(red: 0, green: 0, blue: 1, alpha: 0.5)
        ampereColor.setStroke()
        line.lineWidth = 5
        line.stroke()
    }
}
