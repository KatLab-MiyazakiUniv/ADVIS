//
//  PartsDraw.swift
//  ADVIS
//
//  Created by Tatsumi Nishida on 8/23/18.
//  Copyright © 2018 Tatsumi. All rights reserved.
//

import Foundation

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

    var wireGetPointXArray: Array<CGFloat> = [] // ジャンパワイヤを描画する点のx座標用配列
    var wireGetPointYArray: Array<CGFloat> = [] // ジャンパワイヤを描画する点のy座標用配列
    var wireTranslatePointArray: Array<Int> = [] // ジャンパワイヤを描画する点を保持する配列

    var ledGetPointXArray: [CGFloat] = [] // LEDを描画する点のx座標用配列
    var ledGetPointYArray: [CGFloat] = [] // LEDを描画する点のy座標用配列
    var ledTranslatePointArray: [Int] = [] // LEDを描画する点を保持する配列

    var resistorGetPointXArray: [CGFloat] = [] // 抵抗器を描画する点のx座標用配列
    var resistorGetPointYArray: [CGFloat] = [] // 抵抗器を描画する点のy座標用配列
    var resistorTranslatePointArray: [Int] = [] // 抵抗器を描画する点を保持する配列

    var gyroGetPointXArray: [CGFloat] = [] // ジャイロセンサを描画する点のx座標用配列
    var gyroGetPointYArray: [CGFloat] = [] // ジャイロセンサを描画する点のy座標用配列
    var gyroTranslatePointArray: [Int] = [] // ジャイロセンサを描画する点を保持する配列

    //
    var pointControl = ArduinoUnoPointControl12_9()

    /* ジャンパワイヤ描画用の配列に値を入れる */
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

    func ledDraw(translatePoint: Int) {
        pointControl.coordinateTranslate(translatePoint: translatePoint)
        ledGetPointXArray.insert(pointControl.coordinateNumberX, at: ledNumber)
        ledGetPointYArray.insert(pointControl.coordinateNumberY, at: ledNumber)
        ledTranslatePointArray.insert(translatePoint, at: ledNumber)
        ledNumber += 1
    }

    func resistorDraw(translatePoint: Int) {
        pointControl.coordinateTranslate(translatePoint: translatePoint)
        resistorGetPointXArray.insert(pointControl.coordinateNumberX, at: resistorNumber)
        resistorGetPointYArray.insert(pointControl.coordinateNumberY, at: resistorNumber)
        resistorTranslatePointArray.insert(translatePoint, at: resistorNumber)
        resistorNumber += 1
    }

    func gyroDraw(translatePoint: Int) {
        pointControl.coordinateTranslate(translatePoint: translatePoint)
        gyroGetPointXArray.insert(pointControl.coordinateNumberX, at: gyroNumber)
        gyroGetPointYArray.insert(pointControl.coordinateNumberY, at: gyroNumber)
        gyroTranslatePointArray.insert(translatePoint, at: gyroNumber)
        gyroNumber += 1
    }

    /* 配列の中身が2の倍数の時に描画を開始するために必要 */
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
