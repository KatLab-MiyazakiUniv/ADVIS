//
//  ArduinoUnoView.swift
//  ADVIS
//
//  Created by Tatsumi Nishida on 2018/06/05.
//  Copyright © 2018年 Tatsumi Nishida. All rights reserved.
//

import UIKit

class ArduinoUnoView: UIView {
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
        let view = Bundle.main.loadNibNamed("ArduinoUnoView", owner: self, options: nil)?.first as! UIView
        view.frame = bounds
        addSubview(view)
    }
}

/*
 参考サイト
 https://qiita.com/i6r/items/5ff6224b3b7eea62e906
 http://blue-bear.jp/kb/swift4-uiview%E3%81%AEx-y%E5%BA%A7%E6%A8%99%E3%82%84%E6%A8%AA%E5%B9%85%E3%83%BB%E7%B8%A6%E5%B9%85%E3%82%92%E3%82%AB%E3%83%B3%E3%82%BF%E3%83%B3%E3%81%AB%E5%8F%96%E5%BE%97%E3%83%BB%E8%A8%AD%E5%AE%9A/
 */

extension UIView {
    var top: CGFloat {
        get {
            return frame.origin.y
        }
        set {
            var frame = self.frame
            frame.origin.y = newValue
            self.frame = frame
        }
    }

    var bottom: CGFloat {
        get {
            return frame.origin.y + frame.size.height
        }
        set {
            var frame = self.frame
            frame.origin.y = newValue - self.frame.size.height
            self.frame = frame
        }
    }

    var right: CGFloat {
        get {
            return frame.origin.x + frame.size.width
        }
        set {
            var frame = self.frame
            frame.origin.x = newValue - self.frame.size.width
            self.frame = frame
        }
    }

    var left: CGFloat {
        get {
            return frame.origin.x
        }
        set {
            var frame = self.frame
            frame.origin.x = newValue
            self.frame = frame
        }
    }
}
