//
//  AmpereCircleDraw.swift
//  ADVIS
//
//  Created by Tatsumi Nishida on 4/16/19.
//  Copyright © 2019 Tatsumi. All rights reserved.
//

import Foundation
import UIKit

class AmpereCircleDraw: UIView {
    var startX: Double = 0
    var startY: Double = 0

    /// ジャンパワイヤを描画するための座標を設定
    ///
    /// - Parameters:
    ///   - startX: 起点のX座標
    ///   - startY: 起点のY座標
    ///
    /// メンバ変数にそれぞれ代入
    func intoBoardPoint(startX: Double, startY: Double) {
        self.startX = startX
        self.startY = startY
    }

    override func draw(_: CGRect) {
        let ampereCircle = UIBezierPath(ovalIn: CGRect(x: startX, y: startY, width: 35, height: 35))
        ampereCircle.lineWidth = 4
        UIColor.white.setFill()
        ampereCircle.fill()
        UIColor.blue.setStroke()
        ampereCircle.stroke()
    }
}
