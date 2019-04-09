//
//  DangerDraw.swift
//  ADVIS
//
//  Created by Tatsumi Nishida on 8/26/18.
//  Copyright © 2018 Tatsumi. All rights reserved.
//

import Foundation
import UIKit

/// 危険箇所を丸で表するクラス
class DangerDraw: UIView {
    /// 円の中心のX座標
    var startX: Double = 0
    /// 円の中心のY座標
    var startY: Double = 0

    /// 線を描画するための座標を設定
    ///
    /// - Parameters:
    ///   - startX: X座標
    ///   - startY: Y座標
    ///
    /// メンバ変数にそれぞれ代入
    func intoBoardPoint(startX: Double, startY: Double) {
        self.startX = startX
        self.startY = startY
    }

    override func draw(_: CGRect) {
        let ledCircle = UIBezierPath(ovalIn: CGRect(x: startX, y: startY, width: 20, height: 20))
        ledCircle.lineWidth = 4
        UIColor.red.setStroke()
        ledCircle.stroke()

//        let starLayer = CAShapeLayer.init()
//        let starFrame = CGRect.init(x: startX, y: startY, width: 20, height: 20)
//        starLayer.frame = starFrame
//
//        starLayer.strokeColor = UIColor.yellow.cgColor
//        starLayer.fillColor = UIColor.yellow.cgColor
//
//        let starLine = UIBezierPath()
//        starLine.move(to: CGPoint.init(x: 0, y: starFrame.size.height / 3))
//        starLine.addLine(to: CGPoint.init(x: starFrame.size.width / 3, y: starFrame.size.height / 3))
//        starLine.addLine(to: CGPoint.init(x: starFrame.size.width / 2, y: 0))
//        starLine.addLine(to: CGPoint.init(x: starFrame.size.width * 2 / 3, y: starFrame.size.height / 3))
//        starLine.addLine(to: CGPoint.init(x: starFrame.size.width, y: starFrame.size.height / 3))
//        starLine.addLine(to: CGPoint.init(x: starFrame.size.width * 3 / 4, y: starFrame.size.height * 3 / 5))
//        starLine.addLine(to: CGPoint.init(x: starFrame.size.width * 9 / 10 , y: starFrame.size.height * 9 / 10))
//        starLine.addLine(to: CGPoint.init(x: starFrame.size.width / 2, y: starFrame.size.height * 3 / 4))
//        starLine.addLine(to: CGPoint.init(x: starFrame.size.width / 10 , y: starFrame.size.height * 9 / 10))
//        starLine.addLine(to: CGPoint.init(x: starFrame.size.width / 4, y: starFrame.size.height * 3 / 5))
//        starLine.close()
//
//        // 星を描画
//        starLayer.path = starLine.cgPath
    }
}
