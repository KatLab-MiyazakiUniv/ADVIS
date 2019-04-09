//
//  PartsDraw.swift
//  ADVIS
//
//  Created by Tatsumi Nishida on 8/23/18.
//  Copyright © 2018 Tatsumi. All rights reserved.
//

import Foundation

/// モジュール描画Class
class PartsDraw {
//    class var partsDrawInstance : PartsDraw {
//        struct Static {
//            static let instance : PartsDraw = PartsDraw()
//        }
//        return Static.instance
//    }

    var jumperNumber = 0
    var ledNumber = 0
    var resistorNumber = 0
    var gyroNumber = 0

    /// ジャンパワイヤを描画する点のx座標用配列
    var wireGetPointXArray: Array<Double> = []
    /// ジャンパワイヤを描画する点のy座標用配列
    var wireGetPointYArray: Array<Double> = []
    /// ジャンパワイヤを描画する点を保持する配列
    var wireTranslatePointArray: Array<Int> = []

    /// LEDを描画する点のx座標用配列
    var ledGetPointXArray: [Double] = []
    /// LEDを描画する点のy座標用配列
    var ledGetPointYArray: [Double] = []
    /// LEDを描画する点を保持する配列
    var ledTranslatePointArray: [Int] = []

    /// 抵抗器を描画する点のx座標用配列
    var resistorGetPointXArray: [Double] = []
    /// 抵抗器を描画する点のy座標用配列
    var resistorGetPointYArray: [Double] = []
    /// 抵抗器を描画する点を保持する配列
    var resistorTranslatePointArray: [Int] = []

    /// ジャイロセンサを描画する点のx座標用配列
    var gyroGetPointXArray: [Double] = []
    /// ジャイロセンサを描画する点のy座標用配列
    var gyroGetPointYArray: [Double] = []
    /// ジャイロセンサを描画する点を保持する配列
    var gyroTranslatePointArray: [Int] = []

    /// 画面上の座標をいい感じにするインスタンスせ
    var pointControl = ArduinoUnoPointControl12_9()

    /// ジャンパワイヤ描画用の配列に値を入れる
    ///
    /// - Parameter translatePoint: ブレッドボードの番号
    /// 1. ブレッドボード上の値を座標に変換
    /// 2. タップされたX座標をinsert
    /// 3. タップされたY座標をinsert
    /// 4. 使用したtranslatepointを保持
    func wireDraw(translatePoint: Int) {
        /* ブレッドボード上の値を座標に変換 */
        // pointControl.
        pointControl.coordinateTranslate(translatePoint: translatePoint)
        /* タッチされた座標を配列に入れる(x) */
        wireGetPointXArray.insert(pointControl.coordinateNumberX, at: jumperNumber)
        /* タッチされた座標を配列に入れる(y) */
        wireGetPointYArray.insert(pointControl.coordinateNumberY, at: jumperNumber)
        /* 使用したtranslatepointを保持 */
        wireTranslatePointArray.insert(translatePoint, at: jumperNumber)
        jumperNumber += 1
    }

    /// LED描画用の配列に値を入れる
    ///
    /// - Parameter translatePoint: ブレッドボードの番号
    /// 1. ブレッドボード上の値を座標に変換
    /// 2. タップされたX座標をinsert
    /// 3. タップされたY座標をinsert
    /// 4. 使用したtranslatepointを保持
    func ledDraw(translatePoint: Int) {
        pointControl.coordinateTranslate(translatePoint: translatePoint)
        ledGetPointXArray.insert(pointControl.coordinateNumberX, at: ledNumber)
        ledGetPointYArray.insert(pointControl.coordinateNumberY, at: ledNumber)
        ledTranslatePointArray.insert(translatePoint, at: ledNumber)
        ledNumber += 1
    }

    /// 抵抗器描画用の配列に値を入れる
    ///
    /// - Parameter translatePoint: ブレッドボードの番号
    /// 1. ブレッドボード上の値を座標に変換
    /// 2. タップされたX座標をinsert
    /// 3. タップされたY座標をinsert
    /// 4. 使用したtranslatepointを保持
    func resistorDraw(translatePoint: Int) {
        pointControl.coordinateTranslate(translatePoint: translatePoint)
        resistorGetPointXArray.insert(pointControl.coordinateNumberX, at: resistorNumber)
        resistorGetPointYArray.insert(pointControl.coordinateNumberY, at: resistorNumber)
        resistorTranslatePointArray.insert(translatePoint, at: resistorNumber)
        resistorNumber += 1
    }

    /// ジャイロセンサ描画用の配列に値を入れる
    ///
    /// - Parameter translatePoint: ブレッドボードの番号
    /// 1. ブレッドボード上の値を座標に変換
    /// 2. タップされたX座標をinsert
    /// 3. タップされたY座標をinsert
    /// 4. 使用したtranslatepointを保持
    func gyroDraw(translatePoint: Int) {
        pointControl.coordinateTranslate(translatePoint: translatePoint)
        gyroGetPointXArray.insert(pointControl.coordinateNumberX, at: gyroNumber)
        gyroGetPointYArray.insert(pointControl.coordinateNumberY, at: gyroNumber)
        gyroTranslatePointArray.insert(translatePoint, at: gyroNumber)
        gyroNumber += 1
    }

    /// 配列の中身が2の倍数の時に描画を開始するためのメソッド
    ///
    /// - Parameter flagNumber: 配列の中身の個数
    /// - Returns: 0もしくは，1を返す
    func flagDraw(flagNumber: Int) -> Int {
        if flagNumber == 0 {
            if jumperNumber > 0 && jumperNumber % 2 == 0 {
                return 1
            } else {
                return 0
            }

        } else if flagNumber == 1 {
            if ledNumber > 0 && ledNumber % 2 == 0 {
                return 1
            } else {
                return 0
            }

        } else if flagNumber == 2 {
            if resistorNumber > 0 && resistorNumber % 2 == 0 {
                return 1
            } else {
                return 0
            }

        } else if flagNumber == 3 {
            if gyroNumber > 0 && gyroNumber % 4 == 0 {
                return 1
            } else {
                return 0
            }
        } else {
            return 0
        }
    }
}
