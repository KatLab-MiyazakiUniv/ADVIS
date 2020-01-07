//
//  VoltCheck.swift
//  ADVIS
//
//  Created by T.N.Revolution on 1/7/20
//  Copyright © 2020 Tatsumi. All rights reserved.
//

import Foundation

class VoltCheck {
    func voltRun(runRan: Int) -> Int {
        switch runRan {
        case 0: // 0だと描画済みのパーツを削除
            return 1
        default: // 1以外は描画開始
            return 0
        }
    }
}
