//
//  VoltDraw.swift
//  ADVIS
//
//  Created by Tatsumi Nishida on 8/26/18.
//  Copyright © 2018 Tatsumi. All rights reserved.
//

import Foundation
import UIKit

class VoltDraw: UIView {
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
<<<<<<< HEAD
        let line = UIBezierPath() // インスタンス生成
        line.move(to: CGPoint(x: startX, y: startY)) // 起点
        line.addLine(to: CGPoint(x: endX, y: endY)) // 終点
        line.close() // 線を結ぶ
        let voltColor = UIColor(red: 1, green: 1, blue: 0, alpha: 0.5) // 色の設定
        voltColor.setStroke() // 色の設定
        line.lineWidth = 5 // 線の太さ
        line.stroke() // 描画
=======
        let line = UIBezierPath()
        line.move(to: CGPoint(x: startX, y: startY))
        line.addLine(to: CGPoint(x: endX, y: endY))
        line.close()
        let voltColor = UIColor(red: 1, green: 1, blue: 0, alpha: 0.5)
        voltColor.setStroke()
        line.lineWidth = 5 // 線の太さ
        line.stroke()
>>>>>>> ef9befadea0653d32d108254da592270cd16329a
    }
}
