//
//  LedLineDraw.swift
//  ADVIS
//
//  Created by Tatsumi Nishida on 8/24/18.
//  Copyright © 2018 Tatsumi. All rights reserved.
//

import Foundation

class LedDraw: UIView {
    var startX: CGFloat = 0
    var startY: CGFloat = 0
    var endX: CGFloat = 0
    var endY: CGFloat = 0
    func intoBoardPoint(startX: CGFloat, startY: CGFloat, endX: CGFloat, endY: CGFloat) {
        self.startX = startX
        self.startY = startY
        self.endX = endX
        self.endY = endY
    }

    override func draw(_: CGRect) {
        let line = UIBezierPath()
        // 起点
        line.move(to: CGPoint(x: startX, y: startY))
        // 終点
        line.addLine(to: CGPoint(x: endX, y: endY))
        // ラインを結ぶ
        line.close()
        // 色の設定
        UIColor.gray.setStroke()
        // ライン幅
        line.lineWidth = 3
        // 描画
        line.stroke()
        // 電球の描画
        let ledCircle = UIBezierPath(ovalIn: CGRect(x: (startX + endX) / 2 - 6,
                                                    y: (startY + endY) / 2 - 6,
                                                    width: 15, height: 15))
        ledCircle.lineWidth = 3
        UIColor.gray.setFill()
        ledCircle.fill()
        UIColor.green.setStroke()
        ledCircle.stroke()
    }
}
