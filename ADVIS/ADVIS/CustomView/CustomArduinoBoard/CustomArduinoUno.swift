//
//  ArduinoUnoADVIS.swift
//  ADVIS
//
//  Created by Tatsumi Nishida on 2018/08/17.
//  Copyright © 2018年 Tatsumi Nishida. All rights reserved.
//

import UIKit

class CustomArduinoUno: UIView {
    var tapLocation: CGPoint = CGPoint()
    var cgRect: CGRect = CGRect()
    var uiView = UIView()

    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */

    // コードから生成された場合
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadNib()
    }

    // ストーリーボードから生成された場合
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        loadNib()
    }

    func loadNib() {
        let view = Bundle.main.loadNibNamed("CustomArduinoUno", owner: self, options: nil)?.first as! UIView
        view.frame = bounds
        addSubview(view)
    }
}
