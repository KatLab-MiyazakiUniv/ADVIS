//
//  VoltCircleDraw.swift
//  ADVIS
//
//  Created by Tatsumi Nishida on 8/26/18.
//  Copyright © 2018 Tatsumi. All rights reserved.
//

import Foundation
import UIKit

// 電圧値を表示する丸を表示するクラス
class VoltCircleDraw: UIView {
    var startX: Double = 0 /// 円の中心のX座標
    var startY: Double = 0 /// 円の中心のY座標

    /// 線を描画するための座標を設定
    ///
    /// - Parameters:
    ///   - startX: 円の中心のX座標
    ///   - startY: 円の中心のY座標
    ///
    /// メンバ変数にそれぞれ代入
    func intoBoardPoint(startX: Double, startY: Double) {
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
