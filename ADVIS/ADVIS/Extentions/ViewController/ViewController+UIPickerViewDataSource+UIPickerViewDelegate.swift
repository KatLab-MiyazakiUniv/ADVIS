//
//  ViewController+UIPickerViewDataSource+UIPickerViewDelegate.swift
//  ADVIS
//
//  Created by Tatsumi Nishida on 4/16/19.
//  Copyright © 2019 Tatsumi. All rights reserved.
//

import Foundation
import UIKit

let resistorCode = [
    ["黒", "茶", "赤", "橙", "黄", "緑", "青", "紫", "灰", "白"],
    ["黒", "茶", "赤", "橙", "黄", "緑", "青", "紫", "灰", "白"],
    ["黒", "茶", "赤", "橙", "黄", "緑", "青", "紫", "灰", "白", "金", "銀"],
    ["茶", "赤", "金", "銀", "無色"],
]
/// UIPickerView

var resistorCode1 = 1
var resistorCode2 = 5
var resistorCode3 = 1
var resistorCode4 = 5

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    /// UIPickerViewの列の数
    func numberOfComponents(in _: UIPickerView) -> Int {
        logger.debug("\(resistorCode.count)")
        return resistorCode.count
    }

    /// UIPickerViewの行数、要素の全数
    func pickerView(_: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        logger.debug("\(resistorCode[component].count)")
        return resistorCode[component].count
    }

    /// UIPickerViewに表示する配列
    func pickerView(_: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        logger.debug("\(resistorCode[component][row])")
        return resistorCode[component][row]
    }

    /// UIPickerViewのRowが選択された時の挙動
    func pickerView(_: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 0 {
            resistorCode1 = partsDraw.resistorColorTranslateValue(colorCode: resistorCode[component][row])
            logger.debug("\(resistorCode1)")
        } else if component == 1 {
            resistorCode2 = partsDraw.resistorColorTranslateValue(colorCode: resistorCode[component][row])
            logger.debug("\(resistorCode2)")
        } else if component == 2 {
            resistorCode3 = partsDraw.resistorColorTranslateMultiplier(colorCode: resistorCode[component][row])
            logger.debug("\(resistorCode3)")
        } else {
            resistorCode4 = partsDraw.resistorColorTranslateTolerance(colorCode: resistorCode[component][row])
            logger.debug("\(resistorCode4)")
        }
        logger.debug("\(resistorCode[component][row])")
    }
}
