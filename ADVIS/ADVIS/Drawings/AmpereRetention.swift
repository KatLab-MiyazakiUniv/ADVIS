//
//  AmpereRetention.swift
//  ADVIS
//
//  Created by Tatsumi Nishida on 3/10/19.
//  Copyright © 2019 Tatsumi. All rights reserved.
//

import Darwin
import Foundation
import UIKit

/// 電流値をいい感じにするクラス
class AmpereRetention {
    /// インスタンス生成
    private var partsDraw = PartsDraw()
    var arduinoUnoPointControl12_9 = ArduinoUnoPointControl12_9()

    /// 電流の配列に値を入れる際に何番目に入れるかを管理
    var i: [Int] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    /// 電流を描画する点のx座標用配列
    var ampereGetPointXArray: [[Double]] = [[], [], [], [], [], [], [], [], [], [], [], []]
    /// 電流を描画する点のy座標用配列
    var ampereGetPointYArray: [[Double]] = [[], [], [], [], [], [], [], [], [], [], [], []]
    /// 電流を描画する点を保持する配列
    var ampereTranslatePointArray: [[Int]] = [[], [], [], [], [], [], [], [], [], [], [], []]
    /// 電流を求めるための電圧値を保持する配列
    var ampereVoltValue: [[Int]] = [[], [], [], [], [], [], [], [], [], [], [], []]
    /// 電流を求めるための抵抗を保持する配列
    var ampereResistorValue: [[Int]] = [[], [], [], [], [], [], [], [], [], [], [], []]
    /// 電流値を保持する配列
    var ampereValue: [[Double]] = [[], [], [], [], [], [], [], [], [], [], [], []]
    /// 電流の単位を保持する配列
    var ampereUnit: [[String]] = [[], [], [], [], [], [], [], [], [], [], [], []]
    /// 電流計算用の電圧値
    var ampereTotalVoltArray: [Int] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    /// 電流計算用の抵抗値
    var ampereTotalResistorArray: [Double] = [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0]
    var ampereTotalValue: Double = 0.0
    var ampereTotalUnit = ""

    /**
     電流描画用の配列に値を入れる
     - Parameter j: 1つ目の引数
     - Parameter index: 2つ目の引数
     */
    func ampereInsertResistor(j: Int, index: Int) {
        let resistorResult = ampereResistorValue[j][i[j] + 1]
        // 電流値を計算して配列に入れる
        if ampereVoltValue[j][i[j] / 2] > 0 {
            ampereTotalVoltArray[j] = ampereTotalVoltArray[j] + ampereVoltValue[j][i[j] / 2]
            ampereTotalResistorArray[j] = ampereTotalResistorArray[j] + Double(ampereResistorValue[j][i[j]]) * pow(10.0, Double(resistorResult))
            if ampereResistorValue[j][i[j]] != 0 {
                ampereValueCalculate(choice: j, voltValue: ampereVoltValue[j][i[j] / 2], resistorValue: ampereResistorValue[j][i[j]], resistorTolerance: ampereResistorValue[j][i[j] + 1])
            } else {
                ampereResistorValue[j].insert(20, at: i[j] / 2)
                ampereUnit[j].insert("mA", at: i[j] / 2)
            }
        } else if ampereVoltValue[j][i[j] / 2] == 0 && ampereResistorValue[j][i[j]] == 0 {
            ampereValue[j].insert(20, at: i[j] / 2)
            ampereUnit[j].insert("mA", at: i[j] / 2)
        } else {
            ampereValue[j].insert(0, at: i[j] / 2)
            ampereUnit[j].insert("", at: i[j] / 2)
        }
        if index % 2 == 0 {
            /// 抵抗のX座標を配列に代入
            ampereGetPointXArray[j].insert(partsDraw.resistorGetPointXArray[index], at: i[j])
            /// 抵抗のY座標を配列に代入
            ampereGetPointYArray[j].insert(partsDraw.resistorGetPointYArray[index], at: i[j])
            /// 使用したtranslatePointを保持
            ampereTranslatePointArray[j].insert(partsDraw.resistorTranslatePointArray[index], at: i[j])
            i[j] = i[j] + 1
            /// 抵抗のX座標を配列に代入
            ampereGetPointXArray[j].insert(partsDraw.resistorGetPointXArray[index + 1], at: i[j])
            /// 抵抗のY座標を配列に代入
            ampereGetPointYArray[j].insert(partsDraw.resistorGetPointYArray[index + 1], at: i[j])
            /// 使用したtranslatePointを保持
            ampereTranslatePointArray[j].insert(partsDraw.resistorTranslatePointArray[index + 1], at: i[j])
            i[j] = i[j] + 1
        } else {
            /// 抵抗のX座標を配列に代入
            ampereGetPointXArray[j].insert(partsDraw.resistorGetPointXArray[index], at: i[j])
            /// 抵抗のY座標を配列に代入
            ampereGetPointYArray[j].insert(partsDraw.resistorGetPointYArray[index], at: i[j])
            /// 使用したtranslatePointを保持
            ampereTranslatePointArray[j].insert(partsDraw.resistorTranslatePointArray[index], at: i[j])
            i[j] = i[j] + 1
            /// 抵抗のX座標を配列に代入
            ampereGetPointXArray[j].insert(partsDraw.resistorGetPointXArray[index - 1], at: i[j])
            /// 抵抗のY座標を配列に代入
            ampereGetPointYArray[j].insert(partsDraw.resistorGetPointYArray[index - 1], at: i[j])
            /// 使用したtranslatePointを保持
            ampereTranslatePointArray[j].insert(partsDraw.resistorTranslatePointArray[index - 1], at: i[j])
        }
    }

    func ampereInsertLed(j: Int, index: Int) {
        let resistorResult = ampereResistorValue[j][i[j] + 1]
        // 電流値を計算して配列に代入
        if ampereVoltValue[j][i[j] / 2] > 0 {
            ampereTotalVoltArray[j] = ampereTotalVoltArray[j] + ampereVoltValue[j][i[j] / 2]
            ampereTotalResistorArray[j] = ampereTotalResistorArray[j] + Double(ampereResistorValue[j][i[j]]) * pow(10, Double(resistorResult))
            ampereValueCalculate(choice: j, voltValue: ampereVoltValue[j][i[j] / 2], resistorValue: ampereResistorValue[j][i[j]], resistorTolerance: ampereResistorValue[j][i[j] + 1])
        } else {
            ampereValue[j].insert(0, at: i[j] / 2)
            ampereUnit[j].insert("", at: i[j] / 2)
        }
        if index % 2 == 0 {
            /// LEDのX座標を配列に代入
            ampereGetPointXArray[j].insert(partsDraw.ledGetPointXArray[index], at: i[j])
            /// LEDのY座標を配列に代入
            ampereGetPointYArray[j].insert(partsDraw.ledGetPointYArray[index], at: i[j])
            /// 使用したtranslatePointを保持
            ampereTranslatePointArray[j].insert(partsDraw.ledTranslatePointArray[index], at: i[j])
            i[j] = i[j] + 1
            /// LEDのX座標を配列に代入
            ampereGetPointXArray[j].insert(partsDraw.ledGetPointXArray[index + 1], at: i[j])
            /// LEDのY座標を配列に代入
            ampereGetPointYArray[j].insert(partsDraw.ledGetPointYArray[index + 1], at: i[j])
            /// 使用したtranslatePointを保持
            ampereTranslatePointArray[j].insert(partsDraw.ledTranslatePointArray[index + 1], at: i[j])
            i[j] = i[j] + 1
        } else {
            /// LEDのX座標を配列に代入
            ampereGetPointXArray[j].insert(partsDraw.ledGetPointXArray[index], at: i[j])
            /// LEDのY座標を配列に代入
            ampereGetPointYArray[j].insert(partsDraw.ledGetPointYArray[index], at: i[j])
            /// 使用したtranslatePointを保持
            ampereTranslatePointArray[j].insert(partsDraw.ledTranslatePointArray[index], at: i[j])
            i[j] = i[j] + 1
            /// LEDのX座標を配列に代入
            ampereGetPointXArray[j].insert(partsDraw.ledGetPointXArray[index - 1], at: i[j])
            /// LEDのY座標を配列に代入
            ampereGetPointYArray[j].insert(partsDraw.ledGetPointYArray[index - 1], at: i[j])
            /// 使用したtranslatePointを保持
            ampereTranslatePointArray[j].insert(partsDraw.ledTranslatePointArray[index - 1], at: i[j])
            i[j] = i[j] + 1
        }
    }

    func ampereInsertWire(j: Int, index: Int) {
        if ampereVoltValue[j][i[j] / 2] >= 0 {
            ampereValue[j].insert(20, at: i[j] / 2)
            ampereUnit[j].insert("mA", at: i[j] / 2)
        } else {
            ampereValue[j].insert(0, at: i[j] / 2)
            ampereUnit[j].insert("", at: i[j] / 2)
        }
        if index % 2 == 0 {
            /// ジャンパワイヤのX座標を代入
            ampereGetPointXArray[j].insert(partsDraw.wireGetPointXArray[index], at: i[j])
            /// ジャンパワイヤのY座標を代入
            ampereGetPointYArray[j].insert(partsDraw.wireGetPointYArray[index], at: i[j])
            /// 使用したtranslatepointを保持
            ampereTranslatePointArray[j].insert(partsDraw.wireTranslatePointArray[index], at: i[j])
            i[j] = i[j] + 1
            // ジャンパワイヤのX座標を代入
            ampereGetPointXArray[j].insert(partsDraw.wireGetPointXArray[index + 1], at: i[j])
            /// ジャンパワイヤのY座標を代入
            ampereGetPointYArray[j].insert(partsDraw.wireGetPointYArray[index + 1], at: i[j])
            /// 使用したtranslatepointを保持
            ampereTranslatePointArray[j].insert(partsDraw.wireTranslatePointArray[index + 1], at: i[j])
            i[j] = i[j] + 1
        } else {
            /// ジャンパワイヤのX座標を代入
            ampereGetPointXArray[j].insert(partsDraw.wireGetPointXArray[index], at: i[j])
            /// ジャンパワイヤのY座標を代入
            ampereGetPointYArray[j].insert(partsDraw.wireGetPointYArray[index], at: i[j])
            /// 使用したtranslatepointを保持
            ampereTranslatePointArray[j].insert(partsDraw.wireTranslatePointArray[index], at: i[j])
            i[j] = i[j] + 1
            // ジャンパワイヤのX座標を代入
            ampereGetPointXArray[j].insert(partsDraw.wireGetPointXArray[index - 1], at: i[j])
            /// ジャンパワイヤのY座標を代入
            ampereGetPointYArray[j].insert(partsDraw.wireGetPointYArray[index - 1], at: i[j])
            /// 使用したtranslatepointを保持
            ampereTranslatePointArray[j].insert(partsDraw.wireTranslatePointArray[index - 1], at: i[j])
            i[j] = i[j] + 1
        }
    }

    func ampereInsertGyro(j: Int, index: Int) {
        let resistorResult = ampereResistorValue[j][i[j] + 1]
        if ampereVoltValue[j][i[j] / 2] > 0 {
            ampereTotalVoltArray[j] = ampereTotalVoltArray[j] + ampereVoltValue[j][i[j] / 2]
            ampereTotalResistorArray[j] = ampereTotalResistorArray[j] + Double(ampereResistorValue[j][i[j]]) * pow(10, Double(resistorResult))
            ampereValueCalculate(choice: j, voltValue: ampereVoltValue[j][i[j] / 2], resistorValue: ampereResistorValue[j][i[j]], resistorTolerance: ampereResistorValue[j][i[j] + 1])
        } else {
            ampereValue[j].insert(0, at: i[j] / 2)
            ampereUnit[j].insert("", at: i[j] / 2)
        }
        /// ジャイロセンサのX座標を配列に代入
        ampereGetPointXArray[j].insert(partsDraw.gyroGetPointXArray[index / 4 + 3], at: i[j])
        /// ジャイロセンサのY座標を配列に代入
        ampereGetPointYArray[j].insert(partsDraw.gyroGetPointYArray[index / 4 + 3], at: i[j])
        /// 使用したtranslatepointを保持
        ampereTranslatePointArray[j].insert(partsDraw.gyroTranslatePointArray[index / 4 + 3], at: i[j])
        i[j] = i[j] + 1
        /// ジャイロセンサのX座標を配列に代入
        ampereGetPointXArray[j].insert(partsDraw.gyroGetPointXArray[index / 4], at: i[j])
        /// ジャイロセンサのY座標を配列に代入
        ampereGetPointYArray[j].insert(partsDraw.gyroGetPointYArray[index / 4], at: i[j])
        /// 使用したtranslatepointを保持
        ampereTranslatePointArray[j].insert(partsDraw.gyroTranslatePointArray[index / 4], at: i[j])
        i[j] = i[j] + 1

        ampereVoltValue[j].insert(ampereVoltValue[j][i[j] / 2 - 1], at: i[j] / 2)
        ampereResistorValue[j].insert(ampereResistorValue[j][i[j] - 2], at: i[j])
        ampereResistorValue[j].insert(ampereResistorValue[j][i[j] - 1], at: i[j] + 1)

        if ampereVoltValue[j][i[j] / 2] > 0 {
            ampereTotalVoltArray[j] = ampereTotalVoltArray[j] + ampereVoltValue[j][i[j] / 2]
            ampereTotalResistorArray[j] = ampereTotalResistorArray[j] + Double(ampereResistorValue[j][i[j]]) * pow(10, Double(resistorResult))
            ampereValueCalculate(choice: j, voltValue: ampereVoltValue[j][i[j] / 2], resistorValue: ampereResistorValue[j][i[j]], resistorTolerance: ampereResistorValue[j][i[j] + 1])
        } else {
            ampereValue[j].insert(0, at: i[j] / 2)
            ampereUnit[j].insert("", at: i[j] / 2)
        }
        /// ジャイロセンサのX座標を配列に代入
        ampereGetPointXArray[j].insert(partsDraw.gyroGetPointXArray[index / 4 + 3], at: i[j])
        /// ジャイロセンサのY座標を配列に代入
        ampereGetPointYArray[j].insert(partsDraw.gyroGetPointYArray[index / 4 + 3] + 91, at: i[j])
        /// 使用したtranslatepointを保持
        ampereTranslatePointArray[j].insert(partsDraw.gyroTranslatePointArray[index / 4 + 3], at: i[j])
        i[j] = i[j] + 1
        /// ジャイロセンサのX座標を配列に代入
        ampereGetPointXArray[j].insert(partsDraw.gyroGetPointXArray[index / 4], at: i[j])
        /// ジャイロセンサのY座標を配列に代入
        ampereGetPointYArray[j].insert(partsDraw.gyroGetPointYArray[index / 4] + 91, at: i[j])
        /// 使用したtranslatepointを保持
        ampereTranslatePointArray[j].insert(partsDraw.gyroTranslatePointArray[index / 4], at: i[j])
        i[j] = i[j] + 1
    }

    /**
     電流値の計算
     - Parameter j: 1つ目の引数
     - Parameter index: 2つ目の引数
     */
    func ampereValueCalculate(choice: Int, voltValue: Int, resistorValue: Int, resistorTolerance: Int) {
        var ampereResult = Double(voltValue * 1000) / Double(resistorValue)
        var ampereTolerance = -resistorTolerance - 3
        var ampereCharacter = ""
        let log10 = logWithBase(base: 10) //

        if ampereTolerance % 3 != 0 {
            ampereResult = ampereResult * pow(10.0, Double(ampereTolerance % 3))
            ampereTolerance = ampereTolerance - ampereTolerance % 3
        }

        if ampereResult >= 1000 {
            ampereResult = ampereResult / 1000
            ampereTolerance = ampereTolerance - ampereTolerance % 3
        } else if ampereResult < 0.1 {
            ampereResult = ampereResult * 1000
            ampereTolerance = ampereTolerance - 3
        } else if (ampereResult * 100).truncatingRemainder(dividingBy: 10) != 0 {
            ampereResult = ampereResult / 1000
            ampereTolerance = ampereTolerance - 3
        }

        if log10(ampereResult) >= 3 {
            ampereResult = ampereResult / 1000
            ampereTolerance = ampereTolerance + 3
        }

        ampereResult = round(ampereResult / pow(10.0, floor(log10(ampereResult)) - 1)) * pow(10, floor(log10(ampereResult)) - 1)

        if ampereTolerance == 3 {
            ampereCharacter = "kA"
        } else if ampereTolerance == 0 {
            ampereCharacter = "A"
        } else if ampereTolerance == -3 {
            ampereCharacter = "mA"
        } else if ampereTolerance == -6 {
            ampereCharacter = "μA"
        } else if ampereTolerance == -9 {
            ampereCharacter = "nA"
        } else if ampereTolerance == -12 {
            ampereCharacter = "pA"
        } else if ampereTolerance == -15 {
            ampereCharacter = "fA"
        }

        ampereValue[choice].insert(ampereResult, at: i[choice] / 2)
        ampereUnit[choice].insert(ampereCharacter, at: i[choice] / 2)
    }

    /// 電流値の計算
    func ampereValueText(choice _: Int, voltValue: Int, resistorValue: Double) {
        var ampereTotalResult = Double(voltValue * 1000) / Double(resistorValue)
        var ampereTotalTolerance = -3
        var ampereTotalCharacter = ""
        let log10 = logWithBase(base: 10)

        while log10(ampereTotalResult) < 0 {
            ampereTotalResult = ampereTotalResult * 1000
            ampereTotalTolerance = ampereTotalTolerance - 3
        }

        while log10(ampereTotalResult) >= 3 {
            ampereTotalResult = ampereTotalResult / 1000
            ampereTotalTolerance = ampereTotalTolerance + 3
        }
        ampereTotalResult = round(ampereTotalResult / pow(10, floor(log10(ampereTotalResult)) - 1)) * pow(10, floor(log10(ampereTotalResult)) - 1)

        if ampereTotalTolerance == 3 {
            ampereTotalCharacter = "kA"
        } else if ampereTotalTolerance == 0 {
            ampereTotalCharacter = "A"
        } else if ampereTotalTolerance == -3 {
            ampereTotalCharacter = "mA"
        } else if ampereTotalTolerance == -6 {
            ampereTotalCharacter = "μA"
        } else if ampereTotalTolerance == -9 {
            ampereTotalCharacter = "nA"
        } else if ampereTotalTolerance == -12 {
            ampereTotalCharacter = "pA"
        } else if ampereTotalTolerance == -15 {
            ampereTotalCharacter = "fA"
        }

        if resistorValue == 0.0 {
            ampereTotalValue = 20.0
            ampereTotalUnit = "mA"
        } else {
            ampereTotalValue = ampereTotalResult
            ampereTotalUnit = ampereTotalCharacter
        }
    }
}

func logWithBase(base: Double) -> (Double) -> Double {
    return { x in log(x) / log(base) }
}

// func logWithBase(_ base: Double) -> (Double) -> Double {
//    func logWithBase2(x: Double) -> Double {
//        let value: Double = log(x) / log(base)
//        return value
//    }
//    return logWithBase2
// }
