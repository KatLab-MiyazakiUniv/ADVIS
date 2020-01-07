//
//  VoltPinCheck.swift
//  ADVIS
//
//  Created by T.N.Revolution on 1/7/20
//  Copyright © 2020 Tatsumi. All rights reserved.
//

import Foundation

/// 電圧の出力チェックを行う
/// POST通信で受取ったJSONデータをもとに各出力ピンのデータを決定
class VoltPinCheck {
    /// Stringをキーとするピンの状態を管理する辞書型
    let arduinoPinStatusDict: [String: PinStatus]
    /// 各通電区間を管理する配列
    var voltControlArray = Array(repeating: 0, count: 90)
    /// イニシャライザ
    ///
    /// - Parameters:
    ///   - arduinoPinStatusDict: Stringをキーとするピンの状態を管理する辞書型
    ///
    /// メンバ変数にそれぞれ代入
    init(arduinoPinStatusDict: [String: PinStatus]) {
        self.arduinoPinStatusDict = arduinoPinStatusDict
    }

    /// 各出力ピンの電圧値を設定
    func setOutputPin() {
        print("set")
        for (key, pinStatus) in arduinoPinStatusDict {
            if pinStatus.isLow == false, pinStatus.isInput == false {
                switch key {
                case "digitalPin00":
                    voltControlArray[89] = 5
                case "digitalPin01":
                    voltControlArray[88] = 5
                case "digitalPin02":
                    voltControlArray[87] = 5
                case "digitalPin03":
                    voltControlArray[86] = 5
                case "digitalPin04":
                    voltControlArray[85] = 5
                case "digitalPin05":
                    voltControlArray[84] = 5
                case "digitalPin06":
                    voltControlArray[83] = 5
                case "digitalPin07":
                    voltControlArray[82] = 5
                case "digitalPin08":
                    voltControlArray[81] = 5
                case "digitalPin09":
                    voltControlArray[80] = 5
                case "digitalPin10":
                    voltControlArray[79] = 5
                case "digitalPin11":
                    voltControlArray[78] = 5
                case "digitalPin12":
                    voltControlArray[77] = 5
                case "digitalPin13":
                    voltControlArray[76] = 5
                case "GND0":
                    voltControlArray[75] = 0

                case "volt5_0v":
                    voltControlArray[65] = 5
                case "volt3_3v":
                    voltControlArray[64] = 3
                case "vin":
                    voltControlArray[68] = 10
                case "GND1":
                    voltControlArray[67] = 0
                case "GND2":
                    voltControlArray[66] = 0
                case "analogPin00":
                    voltControlArray[69] = 5
                case "analogPin01":
                    voltControlArray[70] = 5
                case "analogPin02":
                    voltControlArray[71] = 5
                case "analogPin03":
                    voltControlArray[72] = 5
                case "analogPin04":
                    voltControlArray[73] = 5
                case "analogPin05":
                    voltControlArray[74] = 5
                default:
                    print("default")
                }
                for (index, value) in voltControlArray.enumerated() {
                    print("配列 [ \(index) ] の値は [ \(value) ]")
                }
            }
        }
    }
}
