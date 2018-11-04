//
//  DangerDraw.swift
//  ADVIS
//
//  Created by Tatsumi Nishida on 8/26/18.
//  Copyright © 2018 Tatsumi. All rights reserved.
//

import Foundation

class DangerDraw: UIView {
    var startX: CGFloat = 0
    var startY: CGFloat = 0

    func intoBoardPoint(startX: CGFloat, startY: CGFloat) {
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
