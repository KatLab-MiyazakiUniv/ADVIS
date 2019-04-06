//
//  LineDraw.swift
//  ADVIS
//
//  Created by Tatsumi Nishida on 8/23/18.
//  Copyright © 2018 Tatsumi. All rights reserved.
//

import Foundation
import UIKit

/// 線を描画するクラス
class LineDraw: UIView {
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

    /// 線を描画するメソッド
    ///
    /// - Parameter _: なし
    /// 1. UIBezierPathインスタンス生成（UIBezierPathについては，[こちら](https://dev.classmethod.jp/smartphone/iphone/play-uibezierpath-1/)）
    /// 2. 起点の座標設定
    /// 3. 終点の座標設定
    /// 4. closeで線を結ぶ
    /// 5. 線の幅を設定（ここでは，5）
    /// 6. 描画
    override func draw(_: CGRect) {
        // make instance
        let line = UIBezierPath()
        // starting point
        line.move(to: CGPoint(x: startX, y: startY))
        // end point
        line.addLine(to: CGPoint(x: endX, y: endY))
        line.close()
        // line color
        UIColor.blue.setStroke()
        // line width
        line.lineWidth = 5
        // draw
        line.stroke()
    }
}
