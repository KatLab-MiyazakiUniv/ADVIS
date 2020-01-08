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
    /// Stringをキーとするピンの状態を管理する辞書型（Swiftの辞書型は順序を保証するものではない．順番通りにしたいならKeyValuePairsを使う．これは，Swift5.0以降で使える．以前は名前が違った．）
    let arduinoPinStatusDict: [String: PinStatus]
    /// 各通電区間を管理する配列
    private var voltControlArray = Array(repeating: 0, count: 90)
    private var voltConnectedArray = [[Int]]()
    private var voltConnectedArrayLength = 0
    /// イニシャライザ
    ///
    /// - Parameters:
    ///   - arduinoPinStatusDict: Stringをキーとするピンの状態を管理する辞書型
    ///
    init(arduinoPinStatusDict: [String: PinStatus]) {
        /// メンバ変数に代入
        self.arduinoPinStatusDict = arduinoPinStatusDict
    }

    /// 通電区間の電圧値を設定（VoltRetentionクラスのvoltControlArrayに代入するために使う）
    ///
    /// - Parameters:
    ///   - arduinoPinStatusDict: Stringをキーとするピンの状態を管理する辞書型
    func setOutputPinSection() -> [Int] {
        print("set")
        var i = 0 // for文の順番を管理（多分もっとおしゃれな書き方がある）
        for (key, pinStatus) in arduinoPinStatusDict {
//            print("KEY: \(key)")
            if pinStatus.isLow == false, pinStatus.isInput == false {
                voltConnectedArray.append([])
                switch key {
                case "digitalPin00":
                    voltControlArray[89] = 5 // 通電区間を管理する配列に代入
                    voltConnectedArray[i].append(432) // ピン番号を管理する2次元配列に代入
                case "digitalPin01":
                    voltControlArray[88] = 5
                    voltConnectedArray[i].append(431)
                case "digitalPin02":
                    voltControlArray[87] = 5
                    voltConnectedArray[i].append(430)
                case "digitalPin03":
                    voltControlArray[86] = 5
                    voltConnectedArray[i].append(429)
                case "digitalPin04":
                    voltControlArray[85] = 5
                    voltConnectedArray[i].append(428)
                case "digitalPin05":
                    voltControlArray[84] = 5
                    voltConnectedArray[i].append(427)
                case "digitalPin06":
                    voltControlArray[83] = 5
                    voltConnectedArray[i].append(426)
                case "digitalPin07":
                    voltControlArray[82] = 5
                    voltConnectedArray[i].append(425)
                case "digitalPin08":
                    voltControlArray[81] = 5
                    voltConnectedArray[i].append(424)
                case "digitalPin09":
                    voltControlArray[80] = 5
                    voltConnectedArray[i].append(423)
                case "digitalPin10":
                    voltControlArray[79] = 5
                    voltConnectedArray[i].append(422)
                case "digitalPin11":
                    voltControlArray[78] = 5
                    voltConnectedArray[i].append(421)
                case "digitalPin12":
                    voltControlArray[77] = 5
                    voltConnectedArray[i].append(420)
                case "digitalPin13":
                    voltControlArray[76] = 5
                    voltConnectedArray[i].append(419)
                case "GND0": // ここ実は書く意味無し
                    voltControlArray[75] = 0

                case "volt3_3v":
                    voltControlArray[64] = 3
                    voltConnectedArray[i].append(404)
                case "volt5_0v":
                    voltControlArray[65] = 5
                    voltConnectedArray[i].append(405)
                case "GND2": // ここ実は書く意味無し
                    voltControlArray[66] = 0
                case "GND1": // ここ実は書く意味無し
                    voltControlArray[67] = 0
                case "vin":
                    voltControlArray[68] = 10
                    voltConnectedArray[i].append(408)
                case "analogPin00":
                    voltControlArray[69] = 5
                    voltConnectedArray[i].append(409)
                case "analogPin01":
                    voltControlArray[70] = 5
                    voltConnectedArray[i].append(410)
                case "analogPin02":
                    voltControlArray[71] = 5
                    voltConnectedArray[i].append(411)
                case "analogPin03":
                    voltControlArray[72] = 5
                    voltConnectedArray[i].append(412)
                case "analogPin04":
                    voltControlArray[73] = 5
                    voltConnectedArray[i].append(413)
                case "analogPin05":
                    voltControlArray[74] = 5
                    voltConnectedArray[i].append(414)
                default:
                    print("default")
                }
                print("\(i)番目")
                i += 1
            }
        }
        // DEBUGで使うやつ
//        for (index, value) in voltControlArray.enumerated() {
//            print("配列 [ \(index) ] の値は [ \(value) ]")
//        }
        // 降順にソートする
        voltConnectedArray = voltConnectedArray.sorted(by: { $0[0] < $1[0] })
        print("VoltPinCheckのvoltConnectedArray: \(voltConnectedArray)")
        voltConnectedArrayLength = i
        return voltControlArray
    }

    /// 通電区間の電圧値を設定（VoltRetentionクラスのvoltControlArrayに代入するために使う）
    ///
    func setOutputPin() -> [[Int]] {
        return voltConnectedArray
    }

    /// voltConnectedArrayLengthを返すゲッター（for文を回すときに使う）
    func getVoltConnectedArrayLength() -> Int {
        return voltConnectedArrayLength
    }
}
