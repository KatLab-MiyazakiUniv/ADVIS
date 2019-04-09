//
//  AmpereRetention.swift
//  ADVIS
//
//  Created by Tatsumi Nishida on 3/10/19.
//  Copyright © 2019 Tatsumi. All rights reserved.
//

import Foundation

/// 電流値をいい感じにするクラス
class AmpereRetention {
    var partsDraw = PartsDraw()
    var arduinoUnoPointControl12_9 = ArduinoUnoPointControl12_9()

    /// 電流の配列に値を入れる際に何番目に入れるかを管理
    var i: [Int] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    /// 電流を描画する点のx座標用配列
    var ampereGetPointXArray: [[Double]] = [[], [], [], [], [], [], [], [], [], [], [], []]
    /// 電流を描画する点のy座標用配列
    var ampereGetPointYArray: [[Double]] = [[], [], [], [], [], [], [], [], [], [], [], []]
    /// 電流を描画する点を保持する配列
    var ampereTranslatePointArray: [[Double]] = [[], [], [], [], [], [], [], [], [], [], [], []]
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
    var ampere_total_value: Double = 0.0
    var ampere_total_unit = ""

    /**
     電流描画用の配列に値を入れる
     - Parameter j: 1つ目の引数
     - Parameter index: 2つ目の引数
     */
    func ampereInsertResistor(j: Int, index _: Int) {
        let resistorResult = ampereResistorValue[j][i[j] + 1]
        // 電流値を計算して配列に入れる
        if ampereVoltValue[j][i[j] / 2] > 0 {
            ampereTotalVoltArray[j] = ampereTotalVoltArray[j] + ampereVoltValue[j][i[j] / 2]
            ampereTotalResistorArray[j] = ampereTotalResistorArray[j] + Double(ampereResistorValue[j][i[j]]) * pow(10.0, Double(resistorResult))
        }
    }
}
