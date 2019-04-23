//
//  ResistorCalculation.swift
//  ADVIS
//
//  Created by Tatsumi Nishida on 4/16/19.
//  Copyright © 2019 Tatsumi. All rights reserved.
//

import Darwin
import Foundation
import UIKit

class ResistorCalculation {
    private var partsDraw = PartsDraw()
    var pointControll = ArduinoUnoPointControl12_9()

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

    /// 抵抗値のカラーコードの計算
    func resistorCalculate(resistorValue: Int, resistorTolerance: Int) -> String {
        var ampereResult = Double(resistorValue)
        var ampereTolerance = resistorTolerance
        var ampereCharacter = ""
        let log10 = logWithBase(base: 10)

        if ampereTolerance % 3 != 0 {
            ampereResult = ampereResult * pow(10.0, Double(ampereTolerance % 3))
            ampereTolerance = ampereTolerance - ampereTolerance % 3
        }
        if ampereResult >= 1000 {
            ampereResult = ampereResult / 1000
            ampereTolerance = ampereTolerance + 3
        } else if ampereResult < 0.1 {
            ampereResult = ampereResult * 1000
            ampereTolerance = ampereTolerance - 3
        } else if (ampereResult * 100).truncatingRemainder(dividingBy: 10) != 0 {
            ampereResult = ampereResult * 1000
            ampereTolerance = ampereTolerance - 3
        }
        if log10(ampereResult) >= 3 {
            ampereResult = ampereResult / 1000
            ampereTolerance = ampereTolerance + 3
        }

        ampereResult = round(ampereResult / pow(10.0, floor(log10(ampereResult)) - 1)) * pow(10.0, floor(log10(ampereResult)) - 1)

        if ampereTolerance == 12 {
            ampereCharacter = "TΩ"
        } else if ampereTolerance == 9 {
            ampereCharacter = "GΩ"
        } else if ampereTolerance == 6 {
            ampereCharacter = "MΩ"
        } else if ampereTolerance == 3 {
            ampereCharacter = "kΩ"
        } else if ampereTolerance == 0 {
            ampereCharacter = "Ω"
        } else if ampereTolerance == -3 {
            ampereCharacter = "mΩ"
        } else if ampereTolerance == -6 {
            ampereCharacter = "μΩ"
        }

        if resistorValue == 0 {
            return "0Ω"
        } else {
            return "\(ampereResult)\(ampereCharacter)"
        }
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

        ampereTotalResult = round(ampereTotalResult / pow(10.0, floor(log10(ampereTotalResult)) - 1)) * pow(10.0, floor(log10(ampereTotalResult)) - 1)

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
