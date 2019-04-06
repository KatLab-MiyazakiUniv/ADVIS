//
//  LedLightupDraw.swift
//  ADVIS
//
//  Created by Tatsumi Nishida on 8/26/18.
//  Copyright © 2018 Tatsumi. All rights reserved.
//

import Foundation
import UIKit

class LedLightupDraw: UIView {
    var startX: Double = 0
    var startY: Double = 0
    var endX: Double = 0
    var endY: Double = 0

    /// 線を描画するための座標を設定
    ///
    /// - Parameters:
    ///   - startX: 起点のX座標
    ///   - startY: 起点のY座標
    ///   - endX: 終点のX座標
    ///   - endY: 週手のY座標
    /// メンバ変数にそれぞれ代入
    func intoBoardPoint(startX: Double, startY: Double, endX: Double, endY: Double) {
        self.startX = startX
        self.startY = startY
        self.endX = endX
        self.endY = endY
    }

    override func draw(_: CGRect) {
        // UIBezierPath のインスタンス生成
        let line = UIBezierPath()
        // 起点
        line.move(to: CGPoint(x: startX, y: startY))
        // 帰着点
        line.addLine(to: CGPoint(x: endX, y: endY))

        // ラインを結ぶ
        line.close()
        // 色の設定
        UIColor.gray.setStroke()
        // ライン幅
        line.lineWidth = 3
        // 描画
        line.stroke()
        let ledCircle = UIBezierPath(ovalIn: CGRect(x: (startX + endX) / 2 - 6,
                                                    y: (startY + endY) / 2 - 6,
                                                    width: 15, height: 15))
        ledCircle.lineWidth = 3
        UIColor.green.setFill()
        ledCircle.fill()
        UIColor.green.setStroke()
        ledCircle.stroke()
    }
}
