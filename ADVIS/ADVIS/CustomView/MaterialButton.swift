//
//  MaterialButton.swift
//  ADVIS
//
//  Created by Tatsumi Nishida on 2018/08/21.
//  Copyright © 2018年 Tatsumi Nishida. All rights reserved.
//

import Foundation

class MaterialButton: UIButton {
    private let tapEffectView = UIView(frame: CGRect(x: 0, y: 0, width: 1, height: 1))

    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        if let point = touches.first?.location(in: self) {
            tapEffectView.frame.origin = point

            tapEffectView.alpha = 0.3
            tapEffectView.isHidden = false
            tapEffectView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)

            UIView.animate(withDuration: 0.5,
                           animations: {
                               self.tapEffectView.alpha = 0
                               self.tapEffectView.transform = CGAffineTransform(scaleX: 200.0, y: 200.0)
            }) { _ in
                self.tapEffectView.isHidden = true
                self.tapEffectView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            }
        }
    }

    private func setup() {
        // corner raidus
        layer.cornerRadius = 4.0
        layer.masksToBounds = true
        // 円を描画
        let shapeLayer = CAShapeLayer()
        shapeLayer.fillColor = UIColor.red.cgColor
        shapeLayer.path = UIBezierPath(ovalIn: tapEffectView.bounds).cgPath
        tapEffectView.layer.addSublayer(shapeLayer)
        tapEffectView.isHidden = true

        addSubview(tapEffectView)
    }
}
