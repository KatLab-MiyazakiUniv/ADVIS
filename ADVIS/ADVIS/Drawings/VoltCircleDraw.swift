//
//  VoltCircleDraw.swift
//  ADVIS
//
//  Created by Tatsumi Nishida on 8/26/18.
//  Copyright © 2018 Tatsumi. All rights reserved.
//

import Foundation
import UIKit

class VoltCircleDraw: UIView {
    var startX: Double = 0
    var startY: Double = 0

<<<<<<< HEAD
//    required init?(coder aDecoder: NSCoder) {
//        self.startX = 0
//        self.startY = 0
//        fatalError("init(coder:) has not been implemented")
//    }

    func intoBoardPoint(startX: CGFloat, startY: CGFloat) {
=======
    /// 線を描画するための座標を設定
    ///
    /// - Parameters:
    ///   - startX: X座標
    ///   - startY: Y座標
    /// メンバ変数にそれぞれ代入
    func intoBoardPoint(startX: Double, startY: Double) {
>>>>>>> ef9befadea0653d32d108254da592270cd16329a
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
