//
//  ViewController.swift
//  ADVIS
//
//  Created by Tatsumi Nishida on 2018/06/04.
//  Copyright © 2018 Tatsumi Nishida. All rights reserved.
//

import CoreMotion
import ExpandableCell
import Foundation
import SCLAlertView
import SwiftyBeaver
import UIKit

/// いろいろするメインのクラス（別名**神クラス**）
class ViewController: UIViewController {
    private var tapLocation: CGPoint = CGPoint()
    private var uiView = UIView()
    private var arduino = true
    // private var arduinoUnoView: ArduinoUnoView? = nil
    var arduinoUnoPointControl12_9 = ArduinoUnoPointControl12_9()
    var voltRetention = VoltRetention()
    let uiPickerView = UIPickerView()

    var wireCount = 0
    var ledCount = 0
    var resistorCount = 0
    var gyroCount = 0
    var pointInt = 0
    var point = "nil"
    // フラグ関係の変数
    var flagDrawWire = 0
    var flagDrawLed = 0
    var flagDrawResistor = 0
    var flagDrawGyro = 0
    var flagBackBegin = 0

    var repeatI = 0
    var voltConnectNext = 0
    var voltControlValue = 0
    var voltValueBefore = 0
    var voltConnectNumber = 0
    var voltValue = 0
    var voltLastValue = 0
    var voltGyroRun = 0
    var voltGyroInValue = 0
    var voltGyroControlNumber = 0
    var iVoltNumber = 0
    var iLedDraw = 0
    var iTest2 = 0
    var voltLastNumber = 0
    var iVoltDraw = 0
    var iTest = 0
    var motionManager: CMMotionManager!

    /* その他の変数 */
    //    var backLed = 0
    //    var backRegistor = 0
    //    var backWire = 0
    //    var backJyro = 0

    var backViewArray: Array<Int> = []
    var ledLightupArrayX: [Double] = []
    var ledLightupArrayY: [Double] = []
    var voltDrawArrayX: [Double] = []
    var voltDrawArrayY: [Double] = []
    var testArray: [Int] = []

    //    private var logoImageView: UIImageView!

//    @IBOutlet runButton: CustomMenuButton!
    @IBOutlet var compileButton: MaterialButton!
    @IBOutlet var runButton: MaterialButton!
    @IBOutlet var backButton: MaterialButton!
    @IBOutlet var cleanButton: MaterialButton!
    @IBOutlet var editButton: MaterialButton!
    @IBOutlet var generateButton: MaterialButton!
    //    @IBOutlet cleanButton: CustomMenuButton!
//    @IBOutlet backButton: CustomMenuButton!
//    @IBOutlet compileButton: CustomMenuButton!
//    @IBOutlet editButton: CustomMenuButton!
//    @IBOutlet generateButton: CustomMenuButton!
    @IBOutlet var tableView: ExpandableTableView!
    @IBOutlet var arduinoImageView: UIImageView!

    var cell: UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: ExpandedCell.ID)!
    }

    //    // CGRectMakeをwrap
    //    func CGRectMake(_ x: Double, _ y: Double, _ width: Double, _ height: Double) -> CGRect {
    //        return CGRect(x: x, y: y, width: width, height: height)
    //    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let deviceSize = judgeDevice(screenSizeHeight: Double(UIScreen.main.nativeBounds.height))
        SCLAlertView().showInfo("\(deviceSize)")
        logger.info("viewDidLoad")
        tableView.expandableDelegate = self as ExpandableDelegate
        tableView.animation = .automatic
        tableView.register(UINib(nibName: "NormalCell", bundle: nil), forCellReuseIdentifier: NormalCell.ID)
        tableView.register(UINib(nibName: "ExpandedCell", bundle: nil), forCellReuseIdentifier: ExpandedCell.ID)
        tableView.register(UINib(nibName: "ExpandableCell", bundle: nil), forCellReuseIdentifier: ExpandableCell2.ID)
        // Delete Empty Cell separator
        tableView.tableFooterView = UIView(frame: .zero)
        uiPickerView.delegate = self
        uiPickerView.dataSource = self
    }

    // RUNボタンを押した場合
    @IBAction func runButtonAction(sender _: Any) {
        wireDrawRan = 0
        ledDrawRan = 0
        resistorDrawRan = 0

        if naturalRan == 0 {
            naturalRan = 1
            // powerの接続を調べる
            while repeatI < 12 {
                voltRetention.pinNumber = 0
                voltConnectNext = voltRetention.voltPowerIn(repeatNumber: repeatI)
                voltControlValue = voltRetention.voltValue
                voltRetention.voltValueControl(pinNumber: voltConnectNext)
                voltValueBefore = voltRetention.voltValue
                repeat {
                    // 変数を戻す0
                    voltRetention.returnPinValue = 0
                    voltRetention.thirtyValue = 0
                    // 接続の行or列に接続があるかを調べる①
                    voltConnectNumber = voltRetention.voltSearchNearConnection(inPinValue: voltConnectNext, repeatNumber: repeatI)
                    // 接続があった場合
                    if voltRetention.returnPinValue != 0 {
                        // 接続があった場合に接続先を調べる②
                        voltConnectNext = voltRetention.voltConnection(inPinNumber: voltConnectNumber, repeatNumber: repeatI)

                        /* gyroセンサのいろいろ */
                        /* [2],[3]がconnectedArrayの同じ中にあったら */
                        if partsDraw.gyroTranslatePointArray.count == 4 && gyroRan == 0 {
                            if voltRetention.voltConnectedArray[repeatI].firstIndex(of: partsDraw.gyroTranslatePointArray[2]) != nil
                                && voltRetention.voltConnectedArray[repeatI].firstIndex(of: partsDraw.gyroTranslatePointArray[3]) != nil {
                                if voltRetention.voltReturnValue(boardNumber: partsDraw.gyroTranslatePointArray[2]) == voltRetention.voltReturnValue(boardNumber: partsDraw.gyroTranslatePointArray[3])
                                    && voltRetention.voltReturnValue(boardNumber: partsDraw.gyroTranslatePointArray[2]) > 3 {
                                    // ジャイロX値出力用ピンの管理
                                    if voltRetention.voltConnectedArray[repeatI].firstIndex(of: partsDraw.gyroTranslatePointArray[1] + 30) == nil {
                                        voltRetention.voltConnectedArray[repeatI].append(partsDraw.gyroTranslatePointArray[1] + 30)
                                    }
                                    // ジャイロY値出力用ピンの管理
                                    if voltRetention.voltConnectedArray[repeatI].firstIndex(of: partsDraw.gyroTranslatePointArray[2] + 30) == nil {
                                        voltRetention.voltConnectedArray[repeatI].append(partsDraw.gyroTranslatePointArray[2] + 30)
                                        voltGyroInValue = voltRetention.voltReturnValue(boardNumber: partsDraw.gyroTranslatePointArray[3])
                                    }
                                    // ジャイロZ値出力用ピンの管理
                                    if voltRetention.voltConnectedArray[repeatI].firstIndex(of: partsDraw.gyroTranslatePointArray[3] + 30) == nil {
                                        voltRetention.voltConnectedArray[repeatI].append(partsDraw.gyroTranslatePointArray[3] + 30)
                                    }
                                    gyroRan = repeatI
                                }
                            }
                        }

                        /* 抵抗器が接続されていた場合に電圧値を３下げる */
                        if partsDraw.resistorTranslatePointArray.firstIndex(of: voltConnectNumber) != nil {
                            voltRetention.voltValue = voltRetention.voltValue - 3
                        }
                        /* LEDがあった場合電圧値を１下げる */
                        if partsDraw.ledTranslatePointArray.firstIndex(of: voltConnectNumber) != nil {
                            voltRetention.voltValue = voltRetention.voltValue - 1
                        }
                        // 電圧値を配列に保存
                        if voltRetention.voltReturnValue(boardNumber: voltConnectNext) < voltRetention.voltValue {
                            voltRetention.voltValueControl(pinNumber: voltConnectNext)
                        }

                        // 接続がなかった場合
                    } else {
                        if voltConnectNext != 0 {
                            iVoltNumber = voltRetention.voltConnectedArray[repeatI].firstIndex(of: voltConnectNext)!
                            iVoltNumber -= 1
                            voltConnectNext = voltRetention.voltConnectedArray[repeatI][iVoltNumber]
                            // 電圧値をもとに戻す
                            if voltRetention.voltValue != voltRetention.voltReturnValue(boardNumber: voltRetention.voltConnectedArray[repeatI][iVoltNumber]) {
                                voltRetention.voltValue = voltRetention.voltReturnValue(boardNumber: voltRetention.voltConnectedArray[repeatI][iVoltNumber])
                            }
                        } else {
                            voltConnectNext = voltRetention.voltConnectedArray[repeatI][0]
                        }
                    }
                } while voltConnectNext != voltRetention.voltConnectedArray[repeatI][0]
                voltRetention.flagPowerIn = 0
                repeatI += 1
            }
            // 各出力ピンのためのfor文の終わり

            if gyroRan != 0 {
                // 電圧の管理
                voltGyroInValue = voltRetention.voltReturnValue(boardNumber: partsDraw.gyroTranslatePointArray[3])
                voltRetention.voltValue = voltGyroInValue / 5
                voltRetention.voltValueControl(pinNumber: partsDraw.gyroTranslatePointArray[3] + 30)

                voltGyroInValue = voltRetention.voltReturnValue(boardNumber: partsDraw.gyroTranslatePointArray[3])
                voltRetention.voltValue = voltGyroInValue / 5
                voltRetention.voltValueControl(pinNumber: partsDraw.gyroTranslatePointArray[1] + 30)

                voltGyroInValue = voltRetention.voltReturnValue(boardNumber: partsDraw.gyroTranslatePointArray[3])
                voltRetention.voltValue = voltGyroInValue / 5
                voltRetention.voltValueControl(pinNumber: partsDraw.gyroTranslatePointArray[2] + 30)
            }
            if gyroRan != 0 {
                for i in 0 ..< 3 {
                    /* 各値出力ピンがアナログ入力ピンに接続されているかを調べる */
                    for j in 1 ..< 4 {
                        /* 各センサー値出力用ピンがそのままAnalog入力ピンに繋がっているかを調べる */
                        if partsDraw.wireTranslatePointArray.firstIndex(of: partsDraw.gyroTranslatePointArray[j] + 60) != nil
                            && partsDraw.wireTranslatePointArray.firstIndex(of: voltRetention.voltInPinArray[i]) != nil {
                            voltGyroRun += 1
                        } else if partsDraw.wireTranslatePointArray.firstIndex(of: partsDraw.gyroTranslatePointArray[j] + 90) != nil
                            && partsDraw.wireTranslatePointArray.firstIndex(of: voltRetention.voltInPinArray[i]) != nil {
                            voltGyroRun += 1
                        } else if partsDraw.wireTranslatePointArray.firstIndex(of: partsDraw.gyroTranslatePointArray[j] + 120) != nil
                            && partsDraw.wireTranslatePointArray.firstIndex(of: voltRetention.voltInPinArray[i]) != nil {
                            voltGyroRun += 1
                        } else if partsDraw.wireTranslatePointArray.firstIndex(of: partsDraw.gyroTranslatePointArray[j] + 150) != nil
                            && partsDraw.wireTranslatePointArray.firstIndex(of: voltRetention.voltInPinArray[i]) != nil {
                            voltGyroRun += 1
                        }
                    }
                    /* GND接続のピンが出ないから直接指定 */
                    /* ジャイロセンサ出力部の電圧を取得 */
                    voltGyroInValue = voltRetention.voltReturnValue(boardNumber: partsDraw.gyroTranslatePointArray[3])
                    /* GND出力部分の電圧を入れる場所を取得 */
                    voltGyroControlNumber = voltRetention.voltControlNumberBack(boardNumber: partsDraw.gyroTranslatePointArray[1])
                    voltRetention.voltControlArray[voltGyroControlNumber] = voltGyroInValue / 5
                }
            }

//            // 3Vより大きい電圧値が入力ピンに送られた場合
//            for i in 0..<12 {
//                if 406...407 ~= voltRetention.voltConnectedArray[i].last!
//                    || 412...418 ~= voltRetention.voltConnectedArray[i].last!
//                    || 425...432 ~= voltRetention.voltConnectedArray[i].last! {
//                    voltLastNumber = voltRetention.voltConnectedArray[i][(voltRetention.voltConnectedArray[i].count)-2]
//                    voltLastValue = voltRetention.voltReturnValue(boardNumber: voltLastNumber)
//                    if voltLastNumber > 3 && partsDraw.resistorTranslatePointArray.index(of: voltLastNumber) == nil || voltLastValue >= 7 {
//                        // 破損の描画
//                        arduinoUnoPointControl12_9.coordinateTranslate(translatePoint: voltRetention.voltConnectedArray[i][voltRetention.voltConnectedArray[i].count-1])
//                        let dangerDraw = DangerDraw.init(frame: CGRect.init(x: 0, y: 0,
//                                                                            width: arduinoImageView.bounds.width,
//                                                                            height: arduinoImageView.bounds.height))
//                        dangerDraw.isOpaque = false
//                        dangerDraw.intoBoardPoint(startX: arduinoUnoPointControl12_9.coordinateNumberX-10,
//                                                  startY: arduinoUnoPointControl12_9.coordinateNumberY-10)
//                        self.view.addSubview(dangerDraw)
//                    }
//                }
//            }

            // アナログピン（入力）に全て接続があったら
            if voltGyroRun > 9 {
                var testFlag = 0

                motionManager = CMMotionManager()
                // 更新周期の設定
                motionManager.accelerometerUpdateInterval = 0.8
                // 加速度の取得開始
                motionManager.startAccelerometerUpdates(to: OperationQueue.current!,
                                                        withHandler: { (accelData: CMAccelerometerData?, _: Error?) in
                                                            if testFlag == 0 {
                                                                let accel: CMAcceleration = accelData!.acceleration
                                                                print("x: \(accel.x)")
                                                                print("y: \(accel.y)")
                                                                print("z: \(accel.z)")
                                                                testFlag = 1
                                                            }
                })
            }

            if gyroRan > 0 {
                // 入力に5V以上入ってきた場合
                if voltRetention.voltReturnValue(boardNumber: partsDraw.gyroTranslatePointArray[3]) > 5 {
                    for i in 2 ..< 4 {
                        arduinoUnoPointControl12_9.coordinateTranslate(translatePoint: partsDraw.gyroTranslatePointArray[i])
                        // 危険箇所のハイライト
                        let dangerDraw = DangerDraw(frame: CGRect(x: 0, y: 0,
                                                                  width: arduinoImageView.bounds.width,
                                                                  height: arduinoImageView.bounds.height))
                        dangerDraw.isOpaque = false
                        dangerDraw.intoBoardPoint(startX: arduinoUnoPointControl12_9.coordinateNumberX - 20,
                                                  startY: arduinoUnoPointControl12_9.coordinateNumberY - 10)
                        view.addSubview(dangerDraw)
                    }
                }
            }

            // LED破損の危険性を知らせる＆&LEDの透過
            if partsDraw.ledTranslatePointArray.count > 1 {
                // LEDの描画分回す
                for _ in 0 ..< partsDraw.ledTranslatePointArray.count / 2 {
                    // LED前後の電圧を調べる
                    if voltRetention.voltReturnValue(boardNumber: partsDraw.ledTranslatePointArray[iLedDraw]) > 0
                        || voltRetention.voltReturnValue(boardNumber: partsDraw.ledTranslatePointArray[iLedDraw + 1]) > 0 {
                        // 1つ目の要素を座標を変換
                        arduinoUnoPointControl12_9.coordinateTranslate(translatePoint: partsDraw.ledTranslatePointArray[iLedDraw])
                        ledLightupArrayX.append(arduinoUnoPointControl12_9.coordinateNumberX)
                        ledLightupArrayY.append(arduinoUnoPointControl12_9.coordinateNumberY)
                        // 2つ目の要素を座標を変換
                        arduinoUnoPointControl12_9.coordinateTranslate(translatePoint: partsDraw.ledTranslatePointArray[iLedDraw + 1])
                        ledLightupArrayX.append(arduinoUnoPointControl12_9.coordinateNumberX)
                        ledLightupArrayY.append(arduinoUnoPointControl12_9.coordinateNumberY)
                        // LEDの点灯
                        let ledLightUpDraw = LedLightupDraw(frame: CGRect(x: 0, y: 0,
                                                                          width: arduinoImageView.bounds.width,
                                                                          height: arduinoImageView.bounds.height))
                        ledLightUpDraw.isOpaque = false
                        ledLightUpDraw.backgroundColor = UIColor.clear
                        ledLightUpDraw.intoBoardPoint(startX: ledLightupArrayX[iLedDraw],
                                                      startY: ledLightupArrayY[iLedDraw],
                                                      endX: ledLightupArrayX[iLedDraw + 1],
                                                      endY: ledLightupArrayY[iLedDraw + 1])
                        view.addSubview(ledLightUpDraw)
                        // 入力値が3Vより大きい場合破損の危険性があるのでハイライト
                        if voltRetention.voltReturnValue(boardNumber: partsDraw.ledTranslatePointArray[iLedDraw]) > 3
                            && voltRetention.voltReturnValue(boardNumber: partsDraw.ledTranslatePointArray[iLedDraw + 1]) < voltRetention.voltReturnValue(boardNumber: partsDraw.ledTranslatePointArray[iLedDraw]) {
                            let dangerDraw = DangerDraw(frame: CGRect(x: 0, y: 0,
                                                                      width: arduinoImageView.bounds.width,
                                                                      height: arduinoImageView.bounds.height))
                            dangerDraw.isOpaque = false
                            dangerDraw.intoBoardPoint(startX: ledLightupArrayX[iLedDraw + 1] - 15,
                                                      startY: ledLightupArrayY[iLedDraw + 1] - 10)
                            view.addSubview(dangerDraw)
                        }
                        // 入力電圧が大きい場合破損の危険性があるのでハイライトPART2
                        if voltRetention.voltReturnValue(boardNumber: partsDraw.ledTranslatePointArray[iLedDraw + 1]) > 3
                            && voltRetention.voltReturnValue(boardNumber: partsDraw.ledTranslatePointArray[iLedDraw]) < voltRetention.voltReturnValue(boardNumber: partsDraw.ledTranslatePointArray[iLedDraw + 1]) {
                            let dangerDraw = DangerDraw(frame: CGRect(x: 0, y: 0,
                                                                      width: arduinoImageView.bounds.width,
                                                                      height: arduinoImageView.bounds.height))
                            dangerDraw.isOpaque = false
                            dangerDraw.intoBoardPoint(startX: ledLightupArrayX[iLedDraw + 1] - 10,
                                                      startY: ledLightupArrayY[iLedDraw + 1] - 10)
                            view.addSubview(dangerDraw)
                        }
                    }
                    iLedDraw += 2
                }
            }
        } else {
            naturalRan = 0
            // 危険箇所表示の削除
            view.subviews.forEach {
                if $0 is DangerDraw {
                    $0.removeFromSuperview()
                }
                if $0 is LedLightupDraw {
                    $0.removeFromSuperview()
                }
            }
            testArray = []
            iTest2 = 0
            voltRetention = VoltRetention()
            ledLightupArrayX.removeAll()
            ledLightupArrayY.removeAll()
            voltConnectNumber = 0
            voltConnectNext = 0
            voltControlValue = 0
            voltValueBefore = 0
            voltValue = 0

            voltLastNumber = 0
            voltLastValue = 0
            repeatI = 0
            iLedDraw = 0
            gyroRan = 0
            voltGyroInValue = 0
        }
    }

    // MARK: - クリーンボタン -

    @IBAction func cleanButtonAction(sender _: Any) {
        //  partsDraw.ledGetPointXArray = []
        partsDraw = PartsDraw()
        voltRetention = VoltRetention()
        backViewArray = []
        wireCount = 0
        ledCount = 0
        resistorCount = 0
        gyroCount = 0
        wireDrawRan = 0
        ledDrawRan = 0
        resistorDrawRan = 0
        testArray = []
        iTest2 = 0
        ledLightupArrayX.removeAll()
        ledLightupArrayY.removeAll()
        flagDrawGyro = 0
        voltConnectNumber = 0
        voltConnectNext = 0
        voltControlValue = 0
        voltValueBefore = 0
        voltValue = 0
        voltLastValue = 0
        voltLastNumber = 0
        repeatI = 0
        gyroRan = 0
        voltGyroInValue = 0
        /* viewの管理 */
        view.subviews.forEach {
            if $0 is LineDraw {
                $0.removeFromSuperview()
            }
            if $0 is LedDraw {
                $0.removeFromSuperview()
            }
            if $0 is ResitorDraw {
                $0.removeFromSuperview()
            }
            if $0 is GyroDraw {
                $0.removeFromSuperview()
            }
            // RUN実行時のview
            if $0 is LedLightupDraw {
                $0.removeFromSuperview()
            }
            if $0 is DangerDraw {
                $0.removeFromSuperview()
            }
            // 選択中のマーク削除
            if $0 is SelectedCircle {
                $0.removeFromSuperview()
            }
        }
    }

    // バックボタンを押した場合
    @IBAction func backButtonAction(sender _: Any) {
        if backViewArray.count > 0 {
            flagBackBegin = 1
            /* LEDが消える場合 */
            if backViewArray.last == 2 && flagBackBegin == 1 && backViewArray.count > 0 {
                partsDraw.ledGetPointXArray.removeLast(2)
                partsDraw.ledGetPointYArray.removeLast(2)
                partsDraw.ledTranslatePointArray.removeLast(2)
                partsDraw.ledNumber -= 2
                ledCount = 0

                /* Viewの削除 */
                view.subviews.forEach {
                    if $0 is LedDraw {
                        $0.removeFromSuperview()
                    }
                }
                /* Viewの再描画 */
                for _ in 0 ..< partsDraw.ledNumber / 2 {
                    let ledDraw = LedDraw(frame: CGRect(x: 0, y: 0,
                                                        width: arduinoImageView.bounds.width,
                                                        height: arduinoImageView.bounds.height))
                    ledDraw.isOpaque = false
                    ledDraw.backgroundColor = UIColor.clear
                    ledDraw.intoBoardPoint(startX: partsDraw.ledGetPointXArray[ledCount],
                                           startY: partsDraw.ledGetPointYArray[ledCount],
                                           endX: partsDraw.ledGetPointXArray[ledCount + 1],
                                           endY: partsDraw.ledGetPointYArray[ledCount + 1])
                    ledCount += 2
                    view.addSubview(ledDraw)
                }
                backViewArray.removeLast()
                flagBackBegin = 0
            }

            /* 抵抗器が消える場合 */
            if backViewArray.last == 3 && flagBackBegin == 1 && backViewArray.count > 0 {
                partsDraw.resistorGetPointXArray.removeLast(2)
                partsDraw.resistorGetPointYArray.removeLast(2)
                partsDraw.resistorTranslatePointArray.removeLast(2)
                partsDraw.resistorNumber -= 2
                resistorCount = 0
                /* viewの削除 */
                view.subviews.forEach {
                    if $0 is ResitorDraw {
                        $0.removeFromSuperview()
                    }
                }
                /* viewの再描画 */
                for _ in 0 ..< partsDraw.resistorNumber / 2 {
                    let resistorDraw = ResitorDraw(frame: CGRect(x: 0, y: 0,
                                                                 width: arduinoImageView.bounds.width,
                                                                 height: arduinoImageView.bounds.height))
                    resistorDraw.isOpaque = false
                    resistorDraw.backgroundColor = UIColor.clear
                    resistorDraw.intoBoardPoint(startX: partsDraw.resistorGetPointXArray[resistorCount],
                                                startY: partsDraw.resistorGetPointYArray[resistorCount],
                                                endX: partsDraw.resistorGetPointXArray[resistorCount + 1],
                                                endY: partsDraw.resistorGetPointYArray[resistorCount + 1])
                    resistorCount += 2
                    view.addSubview(resistorDraw)
                }
                backViewArray.removeLast()
                flagBackBegin = 0
            }
            /* ジャイロセンサが消える場合 */
            if backViewArray.last == 4 && flagBackBegin == 1 && backViewArray.count > 0 {
                partsDraw.gyroGetPointXArray.removeLast(4)
                partsDraw.gyroGetPointYArray.removeLast(4)
                partsDraw.gyroTranslatePointArray.removeLast(4)
                partsDraw.gyroNumber -= 4
                gyroCount = 0
                /* viewの削除 */
                view.subviews.forEach {
                    if $0 is GyroDraw {
                        $0.removeFromSuperview()
                    }
                }
                for _ in 0 ..< partsDraw.gyroNumber / 4 {
                    let gyroDraw = GyroDraw(frame: CGRect(x: 0, y: 0,
                                                          width: arduinoImageView.bounds.width,
                                                          height: arduinoImageView.bounds.height))
                    gyroDraw.isOpaque = false
                    gyroDraw.backgroundColor = UIColor.clear
                    gyroDraw.intoBoardPoint(x1: partsDraw.gyroGetPointXArray[gyroCount], y1: partsDraw.gyroGetPointYArray[gyroCount],
                                            x2: partsDraw.gyroGetPointXArray[gyroCount + 1], y2: partsDraw.gyroGetPointYArray[gyroCount + 1],
                                            x3: partsDraw.gyroGetPointXArray[gyroCount + 2], y3: partsDraw.gyroGetPointYArray[gyroCount + 2],
                                            x4: partsDraw.gyroGetPointXArray[gyroCount + 3], y4: partsDraw.gyroGetPointYArray[gyroCount + 3])
                    gyroCount += 4
                    view.addSubview(gyroDraw)
                }
                backViewArray.removeLast()
                flagBackBegin = 0
            }

            /* ジャンパワイヤが消える場合 */
            if backViewArray.last == 1 && flagBackBegin == 1 && backViewArray.count > 0 {
                partsDraw.wireGetPointXArray.removeLast(2)
                partsDraw.wireGetPointYArray.removeLast(2)
                partsDraw.wireTranslatePointArray.removeLast(2)
                partsDraw.jumperNumber -= 2
                wireCount = 0
                /* Viewの削除 */
                view.subviews.forEach {
                    if $0 is LineDraw {
                        $0.removeFromSuperview()
                    }
                }
                /* Viewの再描画 */
                for _ in 0 ..< partsDraw.jumperNumber / 2 {
                    let lineDraw = LineDraw(frame: CGRect(x: 0, y: 0,
                                                          width: arduinoImageView.bounds.width,
                                                          height: arduinoImageView.bounds.height))
                    lineDraw.isOpaque = false
                    lineDraw.backgroundColor = UIColor.clear
                    lineDraw.intoBoardPoint(startX: partsDraw.wireGetPointXArray[wireCount],
                                            startY: partsDraw.wireGetPointYArray[wireCount],
                                            endX: partsDraw.wireGetPointXArray[wireCount + 1],
                                            endY: partsDraw.wireGetPointYArray[wireCount + 1])
                    wireCount += 2
                    view.addSubview(lineDraw)
                }
                backViewArray.removeLast()
                flagBackBegin = 0
            }
            wireDrawRan = 0
            ledDrawRan = 0
        }
    }

    // とりあえずVOLT RUNにしとく
    @IBAction func compileButtonAction(sender _: Any) {
        wireDrawRan = 0
        ledDrawRan = 0
        resistorDrawRan = 0
//        gyroDrawRan = 0
        view.subviews.forEach {
            if $0 is SelectedCircle {
                $0.removeFromSuperview()
            }
        }

        if runRan == 0 {
            runRan = 1
            // powerの接続を調べる
            while repeatI < 12 {
                voltRetention.pinNumber = 0
                voltConnectNext = voltRetention.voltPowerIn(repeatNumber: repeatI)
                voltControlValue = voltRetention.voltValue
                voltRetention.voltValueControl(pinNumber: voltConnectNext)
                voltValueBefore = voltRetention.voltValue
                repeat {
                    // 変数を戻す0
                    voltRetention.returnPinValue = 0
                    voltRetention.thirtyValue = 0
                    // 接続の行or列に接続があるか調べる1
                    voltConnectNumber = voltRetention.voltSearchNearConnection(inPinValue: voltConnectNext, repeatNumber: repeatI)
                    // 接続があった場合
                    if voltRetention.returnPinValue != 0 {
                        // 接続があった場合に接続先を調べる2
                        voltConnectNext = voltRetention.voltConnection(inPinNumber: voltConnectNumber,
                                                                       repeatNumber: repeatI)
                        // gyroセンサの色々
                        // [2]，[3]がconnectedArrayの同じ中にあったら
                        if partsDraw.gyroTranslatePointArray.count == 4 && gyroRan == 0 {
                            if voltRetention.voltConnectedArray[repeatI].firstIndex(of: partsDraw.gyroTranslatePointArray[2]) != nil
                                && voltRetention.voltConnectedArray[repeatI].firstIndex(of: partsDraw.gyroTranslatePointArray[3]) != nil {
                                // ジャイロセンサのVDDピン，PSDピンの値が同じ値であり，かつ5V以下なら実行
                                if voltRetention.voltReturnValue(boardNumber: partsDraw.gyroTranslatePointArray[2]) == voltRetention.voltReturnValue(boardNumber: partsDraw.gyroTranslatePointArray[3])
                                    && voltRetention.voltReturnValue(boardNumber: partsDraw.gyroTranslatePointArray[2]) > 3 {
                                    // ジャイロX値出力用ピンの管理
                                    if voltRetention.voltConnectedArray[repeatI].firstIndex(of: partsDraw.gyroTranslatePointArray[1] + 30) == nil {
                                        // ジャイロX値の出力ピンをconnectedArrayに追加
                                        voltRetention.voltConnectedArray[repeatI].append(partsDraw.gyroTranslatePointArray[1] + 30)
                                    }

                                    // ジャイロY値出力用ピンの管理
                                    if voltRetention.voltConnectedArray[repeatI].firstIndex(of: partsDraw.gyroTranslatePointArray[2] + 30) == nil {
                                        // ジャイロY値の出力ピンをconnectedArrayに追加
                                        voltRetention.voltConnectedArray[repeatI].append(partsDraw.gyroTranslatePointArray[2] + 30)
                                        voltGyroInValue = voltRetention.voltReturnValue(boardNumber: partsDraw.gyroTranslatePointArray[3])
                                    }

                                    // ジャイロZ値出力用ピンの管理
                                    if voltRetention.voltConnectedArray[repeatI].firstIndex(of: partsDraw.gyroTranslatePointArray[3] + 30) == nil {
                                        /* ジャイロZ値の出力ピンをconnectedArrayに追加 */
                                        voltRetention.voltConnectedArray[repeatI].append(partsDraw.gyroTranslatePointArray[3] + 30)
                                    }
                                    // ２回目はいらないように
                                    gyroRan = 1
                                }
                            }
                        }
                        /* 抵抗器があった場合に電圧値の値を3下げる */
                        if partsDraw.resistorTranslatePointArray.firstIndex(of: voltConnectNumber) != nil {
                            voltRetention.voltValue -= 3
                        }
                        /* LEDがあった場合に電圧値の値を1下げる */
                        if partsDraw.ledTranslatePointArray.firstIndex(of: voltConnectNumber) != nil {
                            voltRetention.voltValue -= 1
                        }
                        /* 電圧の値を配列に保存 */
                        if voltRetention.voltReturnValue(boardNumber: voltConnectNext) < voltRetention.voltValue {
                            voltRetention.voltValueControl(pinNumber: voltConnectNext)
                        }

                        /* 接続がなかった場合 */
                    } else {
                        if voltConnectNext != 0 {
                            iVoltNumber = voltRetention.voltConnectedArray[repeatI].firstIndex(of: voltConnectNext)!
                            iVoltNumber -= 1
                            voltConnectNext = voltRetention.voltConnectedArray[repeatI][iVoltNumber]
                            // 電圧値をもとに戻す
                            if voltRetention.voltValue != voltRetention.voltReturnValue(boardNumber: voltRetention.voltConnectedArray[repeatI][iVoltNumber]) {
                                voltRetention.voltValue = voltRetention.voltReturnValue(boardNumber: voltRetention.voltConnectedArray[repeatI][iVoltNumber])
                            }
                        } else {
                            voltConnectNext = voltRetention.voltConnectedArray[repeatI][0]
                        }
                    }
                } while voltConnectNext != voltRetention.voltConnectedArray[repeatI][0]
                voltRetention.flagPowerIn = 0
                repeatI += 1
            } // 各出力ピンのためのwhile文終わり

            /* 破損の可能性があるピンを調べ出す */
            /* 入力ピン同士で繋がっていた場合 */
            for i in 0 ..< 12 {
                for j in 0 ..< 12 {
                    /* conectedArrayの中に出力ピンのどれかのナンバーがあればtrue */
                    if voltRetention.voltConnectedArray[i].firstIndex(of: voltRetention.voltConnectedArray[j][0]) != nil {
                        /* conectedArrayの中に見つかった出力ピンのナンバーが0番目以外であればtrue */
                        if voltRetention.voltConnectedArray[i].firstIndex(of: voltRetention.voltConnectedArray[j][0]) != 0 {
                            arduinoUnoPointControl12_9.coordinateTranslate(translatePoint: voltRetention.voltConnectedArray[j][0])
                            let dangerDraw = DangerDraw(frame: CGRect(x: 0, y: 0,
                                                                      width: arduinoImageView.bounds.width,
                                                                      height: arduinoImageView.bounds.height))
                            dangerDraw.isOpaque = false
                            dangerDraw.intoBoardPoint(startX: arduinoUnoPointControl12_9.coordinateNumberX - 10,
                                                      startY: arduinoUnoPointControl12_9.coordinateNumberY - 10)
                            view.addSubview(dangerDraw)
                        }
                    }
                }
            }

            if gyroRan != 0 {
                // 電圧の管理
                voltGyroInValue = voltRetention.voltReturnValue(boardNumber: partsDraw.gyroTranslatePointArray[3])
                voltRetention.voltValue = voltGyroInValue / 5
                voltRetention.voltValueControl(pinNumber: partsDraw.gyroTranslatePointArray[3] + 30)

                voltGyroInValue = voltRetention.voltReturnValue(boardNumber: partsDraw.gyroTranslatePointArray[3])
                voltRetention.voltValue = voltGyroInValue / 5
                voltRetention.voltValueControl(pinNumber: partsDraw.gyroTranslatePointArray[1] + 30)

                voltGyroInValue = voltRetention.voltReturnValue(boardNumber: partsDraw.gyroTranslatePointArray[3])
                voltRetention.voltValue = voltGyroInValue / 5
                voltRetention.voltValueControl(pinNumber: partsDraw.gyroTranslatePointArray[2] + 30)

                for i in 0 ..< 3 {
                    // 各出力ピンがアナログ入力ピンに接続されているかを調べる
                    for j in 1 ..< 4 {
                        if partsDraw.wireTranslatePointArray.firstIndex(of: partsDraw.gyroTranslatePointArray[j] + 60) != nil
                            && partsDraw.wireTranslatePointArray.firstIndex(of: voltRetention.voltInPinArray[i]) != nil {
                            voltGyroRun += 1
                        } else if partsDraw.wireTranslatePointArray.firstIndex(of: partsDraw.gyroTranslatePointArray[j] + 90) != nil
                            && partsDraw.wireTranslatePointArray.firstIndex(of: voltRetention.voltInPinArray[i]) != nil {
                            voltGyroRun += 1
                        } else if partsDraw.wireTranslatePointArray.firstIndex(of: partsDraw.gyroTranslatePointArray[j] + 120) != nil
                            && partsDraw.wireTranslatePointArray.firstIndex(of: voltRetention.voltInPinArray[i]) != nil {
                            voltGyroRun += 1
                        } else if partsDraw.wireTranslatePointArray.firstIndex(of: partsDraw.gyroTranslatePointArray[j] + 150) != nil
                            && partsDraw.wireTranslatePointArray.firstIndex(of: voltRetention.voltInPinArray[i]) != nil {
                            voltGyroRun += 1
                        }
                    }
                    /* GND接続のピンが出ないから直接指定 */
                    // ジャイロセンサ出力部の電圧を取得
                    voltGyroInValue = voltRetention.voltReturnValue(boardNumber: partsDraw.gyroTranslatePointArray[3])
                    // GND出力部の電圧を入れる場所を取得
                    voltGyroControlNumber = voltRetention.voltControlNumberBack(boardNumber: partsDraw.gyroTranslatePointArray[1])
                    voltRetention.voltControlArray[voltGyroControlNumber] = voltGyroInValue / 5
                }
            }
            // 3Vより大きい電圧値が入力ピンに送られた場合
            for iSearch in 0 ..< 12 {
                if 406 ... 407 ~= voltRetention.voltConnectedArray[iSearch].last!
                    || 412 ... 418 ~= voltRetention.voltConnectedArray[iSearch].last!
                    || 425 ... 432 ~= voltRetention.voltConnectedArray[iSearch].last! {
                    voltLastNumber = voltRetention.voltConnectedArray[iSearch][(voltRetention.voltConnectedArray[iSearch].count) - 2]
                    voltLastValue = voltRetention.voltReturnValue(boardNumber: voltLastNumber)

                    if voltLastValue > 3 && partsDraw.resistorTranslatePointArray.firstIndex(of: voltLastNumber) == nil || voltLastValue >= 7 {
                        // 破損の描画
                        arduinoUnoPointControl12_9.coordinateTranslate(translatePoint: voltRetention.voltConnectedArray[iSearch][voltRetention.voltConnectedArray[iSearch].count - 1])
                        let dangerDraw = DangerDraw(frame: CGRect(x: 0, y: 0,
                                                                  width: arduinoImageView.bounds.width,
                                                                  height: arduinoImageView.bounds.height))
                        dangerDraw.isOpaque = false
                        dangerDraw.intoBoardPoint(startX: arduinoUnoPointControl12_9.coordinateNumberX - 10,
                                                  startY: arduinoUnoPointControl12_9.coordinateNumberY - 10)
                        view.addSubview(dangerDraw)
                    }
                }
            }

            /* voltControl配列内部の0以外の箇所をtestArrayに追加 */
            for i in 0 ..< 64 {
                if voltRetention.voltControlArray[i] != 0 {
                    // ボード上の座標に戻す
                    voltRetention.voltBoardTranslate(voltTransNumber: i)
                    testArray.append(voltRetention.voltDrawStart)
                    testArray.append(voltRetention.voltDrawEnd)
                }
            }
            iVoltDraw = testArray.count / 2

            // 電圧ライン（黄色）の描画
            if testArray.count - 1 > iTest2 {
                for iTest in 0 ..< iVoltDraw {
                    arduinoUnoPointControl12_9.coordinateTranslate(translatePoint: testArray[iTest2])
                    voltDrawArrayX.append(arduinoUnoPointControl12_9.coordinateNumberX)
                    voltDrawArrayY.append(arduinoUnoPointControl12_9.coordinateNumberY)
                    arduinoUnoPointControl12_9.coordinateTranslate(translatePoint: testArray[iTest2 + 1])
                    voltDrawArrayX.append(arduinoUnoPointControl12_9.coordinateNumberX)
                    voltDrawArrayY.append(arduinoUnoPointControl12_9.coordinateNumberY)
                    // 電圧を文字で描画
                    voltValue = voltRetention.voltReturnValue(boardNumber: testArray[iTest2])
//                    let voltLabel = UILabel(frame: CGRect(x: 0, y: 0,
//                                                          width: arduinoImageView.bounds.width,
//                                                          height: arduinoImageView.bounds.height))
                    var voltLabel = UILabel()

                    voltLabel.isOpaque = false
                    // 電圧を表示
                    let voltDraw = VoltDraw(frame: CGRect(x: 0, y: 0,
                                                          width: arduinoImageView.bounds.width,
                                                          height: arduinoImageView.bounds.height))
                    if iTest == 0 {
                        voltDraw.backgroundColor = UIColor(white: 0.5, alpha: 0.6)
                    } else {
                        voltDraw.isOpaque = false
                    }

                    voltDraw.intoBoardPoint(startX: voltDrawArrayX[iTest2], startY: voltDrawArrayY[iTest2],
                                            endX: voltDrawArrayX[iTest2 + 1], endY: voltDrawArrayY[iTest2 + 1])
                    view.addSubview(voltDraw)

                    // 文字の位置
                    if 51 ... 350 ~= testArray[iTest2] {
                        if voltValue < 10 {
                            voltLabel = UILabel(frame: CGRect(x: arduinoUnoPointControl12_9.coordinateNumberX - 15,
                                                              y: arduinoUnoPointControl12_9.coordinateNumberY - 77,
                                                              width: 30, height: 30))
                        } else {
                            voltLabel = UILabel(frame: CGRect(x: arduinoUnoPointControl12_9.coordinateNumberX - 15,
                                                              y: arduinoUnoPointControl12_9.coordinateNumberY - 77,
                                                              width: 30, height: 30))
                        }
                    } else {
                        if voltValue < 10 {
                            voltLabel = UILabel(frame: CGRect(x: arduinoUnoPointControl12_9.coordinateNumberX - 465,
                                                              y: arduinoUnoPointControl12_9.coordinateNumberY - 15,
                                                              width: 30, height: 30))
                        } else {
                            voltLabel = UILabel(frame: CGRect(x: arduinoUnoPointControl12_9.coordinateNumberX - 465,
                                                              y: arduinoUnoPointControl12_9.coordinateNumberY - 15,
                                                              width: 30, height: 30))
                        }
                    }

                    // 文字の描画
                    voltLabel.font = UIFont.systemFont(ofSize: 20) // font size
                    voltLabel.backgroundColor = UIColor.white
                    voltLabel.cornerRadius = 15
                    voltLabel.textAlignment = .center // 中心寄せ
                    voltLabel.borderWidth = 5 // 縁の幅
                    voltLabel.borderColor = UIColor.yellow
                    voltLabel.text = String(voltValue)
                    voltLabel.tag = 1
                    voltLabel.textColor = UIColor.orange
                    voltLabel.shadowColor = UIColor.orange
                    view.addSubview(voltLabel)
                    iTest2 += 2
                }
            }
            // ジャイロセンサの値を出力
            // アナログピン（入力）に全て接続があったら
            if voltGyroRun > 3 {
                // MotionManagerの生成
                motionManager = CMMotionManager()
                // 更新周期の設定
                motionManager.accelerometerUpdateInterval = 0.1
                // 加速度の取得開始
                motionManager.startAccelerometerUpdates(to: OperationQueue.current!,
                                                        withHandler: { (accelData: CMAccelerometerData?, _: Error?) in
                                                            let accel: CMAcceleration = accelData!.acceleration
                                                            print("x: \(accel.x)")
                                                            print("y: \(accel.y)")
                                                            print("z: \(accel.z)")

                })
            }
        } else {
            runRan = 0
            // 電圧線の消去
            view.subviews.forEach {
                if $0 is DangerDraw {
                    $0.removeFromSuperview()
                }
                if $0 is VoltDraw {
                    $0.removeFromSuperview()
                }
                /* 文字の消去 */
                if $0.tag == 1 {
                    $0.removeFromSuperview()
                }
            }
            testArray = []
            iTest2 = 0
            voltRetention = VoltRetention()
            testArray.removeAll()
            voltDrawArrayX.removeAll()
            voltDrawArrayY.removeAll()

            flagDrawGyro = 0
            voltConnectNumber = 0
            voltConnectNext = 0
            voltControlValue = 0
            voltValueBefore = 0
            voltValue = 0
            voltLastNumber = 0
            voltLastValue = 0
            repeatI = 0
            gyroRan = 0
            voltGyroInValue = 0
        }
    }

    @IBAction func editButtonAction(sender _: Any) {}

    @IBAction func generateButtonAction(sender _: Any) {}

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with _: UIEvent?) {
        // Get touch event
        let touch = touches.first
        // Get tapped coordinate
        tapLocation = touch!.location(in: view)
        point = String(arduinoUnoPointControl12_9.pointTranslate(pointX: Double(tapLocation.x), pointY: Double(tapLocation.y)))
        pointInt = Int(arduinoUnoPointControl12_9.pointTranslate(pointX: Double(tapLocation.x), pointY: Double(tapLocation.y)))
        arduinoUnoPointControl12_9.coordinateTranslate(
            translatePoint: arduinoUnoPointControl12_9.pointTranslate(pointX: Double(tapLocation.x), pointY: Double(tapLocation.y))
        )
        logger.info("X座標: \(tapLocation.x)")
        logger.info("Y座標: \(tapLocation.y)")

        // ジャンパワイヤここから
        if pointInt != 0 && wireDrawRan == 1 && partsDraw.wireTranslatePointArray.firstIndex(of: pointInt) == nil {
            partsDraw.wireDraw(translatePoint: arduinoUnoPointControl12_9.pointTranslate(pointX: Double(tapLocation.x), pointY: Double(tapLocation.y)))
            flagDrawWire = 1
            view.addSubview(selectedCircle(uiImageView: arduinoImageView, tapLocation: tapLocation))
        }

        if partsDraw.wireGetPointXArray.count % 2 != 0 && wireDrawRan != 1 {
            partsDraw.wireGetPointXArray.removeLast()
            partsDraw.wireGetPointYArray.removeLast()
            partsDraw.jumperNumber -= 1
            view.subviews.forEach {
                if $0 is SelectedCircle {
                    $0.removeFromSuperview()
                }
            }
        }

        if pointInt != 0 && partsDraw.flagDraw(flagNumber: 0) == 1 && wireDrawRan == 1 && flagDrawWire == 1 {
            let lineDraw = LineDraw(frame: CGRect(x: 0, y: 0,
                                                  width: arduinoImageView.bounds.width,
                                                  height: arduinoImageView.bounds.height))
            lineDraw.isOpaque = false
            lineDraw.backgroundColor = UIColor.clear
            lineDraw.intoBoardPoint(startX: partsDraw.wireGetPointXArray[wireCount],
                                    startY: partsDraw.wireGetPointYArray[wireCount],
                                    endX: partsDraw.wireGetPointXArray[wireCount + 1],
                                    endY: partsDraw.wireGetPointYArray[wireCount + 1])
            wireCount += 2
            view.addSubview(lineDraw)
            backViewArray.append(1)
            flagDrawWire = 0
            view.subviews.forEach {
                if $0 is SelectedCircle {
                    $0.removeFromSuperview()
                }
            }
        }
        // ジャンパワイヤここまで

        // LEDここから
        if pointInt != 0 && ledDrawRan == 1 && partsDraw.ledTranslatePointArray.firstIndex(of: pointInt) == nil {
            partsDraw.ledDraw(translatePoint: arduinoUnoPointControl12_9.pointTranslate(pointX: Double(tapLocation.x), pointY: Double(tapLocation.y)))
            flagDrawLed = 1
            view.addSubview(selectedCircle(uiImageView: arduinoImageView, tapLocation: tapLocation))
        }
        /* LEDボタンOFF時に要素が一つだけ残っていた場合消す */
        if partsDraw.ledGetPointXArray.count % 2 != 0 && ledDrawRan != 1 {
            partsDraw.ledGetPointXArray.removeLast()
            partsDraw.ledGetPointYArray.removeLast()
            partsDraw.ledNumber -= 1
            view.subviews.forEach {
                if $0 is SelectedCircle {
                    $0.removeFromSuperview()
                }
            }
        }
        /* LED描画部 */
        if pointInt != 0 && partsDraw.flagDraw(flagNumber: 1) == 1 && ledDrawRan == 1 && flagDrawLed == 1 {
            let ledDraw = LedDraw(frame: CGRect(x: 0, y: 0,
                                                width: arduinoImageView.bounds.width,
                                                height: arduinoImageView.bounds.height))
            ledDraw.isOpaque = false
            ledDraw.backgroundColor = UIColor.clear
            ledDraw.intoBoardPoint(startX: partsDraw.ledGetPointXArray[ledCount],
                                   startY: partsDraw.ledGetPointYArray[ledCount],
                                   endX: partsDraw.ledGetPointXArray[ledCount + 1],
                                   endY: partsDraw.ledGetPointYArray[ledCount + 1])
            ledCount += 2
            view.addSubview(ledDraw)
            backViewArray.append(2)
            flagDrawLed = 0
            view.subviews.forEach {
                if $0 is SelectedCircle {
                    $0.removeFromSuperview()
                }
            }
        }
        // LEDここまで

        /* 抵抗器描画部 */
        if pointInt != 0 && resistorDrawRan == 1 && partsDraw.resistorTranslatePointArray.firstIndex(of: pointInt) == nil {
            partsDraw.resistorDraw(translatePoint: arduinoUnoPointControl12_9.pointTranslate(pointX: Double(tapLocation.x), pointY: Double(tapLocation.y)))
            flagDrawResistor = 1
            view.addSubview(selectedCircle(uiImageView: arduinoImageView, tapLocation: tapLocation))
        }
        if partsDraw.resistorGetPointYArray.count % 2 != 0 && resistorDrawRan != 1 {
            partsDraw.resistorGetPointXArray.removeLast()
            partsDraw.resistorGetPointYArray.removeLast()
            partsDraw.resistorNumber -= 1
            view.subviews.forEach {
                if $0 is SelectedCircle {
                    $0.removeFromSuperview()
                }
            }
        }
        if pointInt != 0 && partsDraw.flagDraw(flagNumber: 2) == 1 && resistorDrawRan == 1 && flagDrawResistor == 1 {
            let resistorDraw = ResitorDraw(frame: CGRect(x: 0, y: 0,
                                                         width: arduinoImageView.bounds.width,
                                                         height: arduinoImageView.bounds.height))
            resistorDraw.isOpaque = false
            resistorDraw.backgroundColor = UIColor.clear
            resistorDraw.intoBoardPoint(startX: partsDraw.resistorGetPointXArray[resistorCount],
                                        startY: partsDraw.resistorGetPointYArray[resistorCount],
                                        endX: partsDraw.resistorGetPointXArray[resistorCount + 1],
                                        endY: partsDraw.resistorGetPointYArray[resistorCount + 1])
            resistorCount += 2
            view.addSubview(resistorDraw)
            backViewArray.append(3)
            flagDrawResistor = 0
            view.subviews.forEach {
                if $0 is SelectedCircle {
                    $0.removeFromSuperview()
                }
            }
        }
        /* 抵抗器ここまで */

        // ジャイロセンサ描画のための配列に値を入れる
        if pointInt != 0 && 171 ... 200 ~= pointInt && gyroDrawRan == 1 && partsDraw.gyroTranslatePointArray.firstIndex(of: pointInt) == nil {
            if partsDraw.gyroTranslatePointArray.count % 4 != 0 && pointInt - 1 == partsDraw.gyroTranslatePointArray.last
                || partsDraw.gyroTranslatePointArray.count % 4 == 0 {
                partsDraw.gyroDraw(translatePoint: arduinoUnoPointControl12_9.pointTranslate(pointX: Double(tapLocation.x), pointY: Double(tapLocation.y)))
                flagDrawGyro = 1
                view.addSubview(selectedCircle(uiImageView: arduinoImageView, tapLocation: tapLocation)) // 選択中
            } else if flagDrawGyro != 0 {
                partsDraw.gyroGetPointXArray.removeLast()
                partsDraw.gyroGetPointYArray.removeLast()
                partsDraw.gyroTranslatePointArray.removeLast()
                partsDraw.gyroNumber -= 1
                partsDraw.gyroDraw(translatePoint: arduinoUnoPointControl12_9.pointTranslate(pointX: Double(tapLocation.x), pointY: Double(tapLocation.y)))
                flagDrawGyro = 0
//                view.subviews.forEach {
//                    if $0 is SelectedCircle {
//                        $0.removeFromSuperview()
//                    }
//                }
            }
        }

        // ジャイロセンサ描画モード:OFF時に不必要な要素が残っていれば消す
        if partsDraw.gyroGetPointXArray.count % 4 != 0 && gyroDrawRan != 1 {
            for _ in 0 ..< partsDraw.gyroGetPointXArray.count % 4 {
                partsDraw.gyroGetPointXArray.removeLast()
                partsDraw.gyroGetPointYArray.removeLast()
                partsDraw.gyroNumber -= 1
            }
            view.subviews.forEach {
                if $0 is SelectedCircle {
                    $0.removeFromSuperview()
                }
            }
        }

        // ジャイロセンサ描画部
        if pointInt != 0 && 171 ... 200 ~= pointInt && partsDraw.flagDraw(flagNumber: 3) == 1 && gyroDrawRan == 1 && flagDrawGyro == 1 {
            let gyroDraw = GyroDraw(frame: CGRect(x: 0, y: 0,
                                                  width: arduinoImageView.bounds.width,
                                                  height: arduinoImageView.bounds.height))
            gyroDraw.isOpaque = false
            gyroDraw.backgroundColor = UIColor.clear
            gyroDraw.intoBoardPoint(x1: partsDraw.gyroGetPointXArray[gyroCount],
                                    y1: partsDraw.gyroGetPointYArray[gyroCount],
                                    x2: partsDraw.gyroGetPointXArray[gyroCount + 1],
                                    y2: partsDraw.gyroGetPointYArray[gyroCount + 1],
                                    x3: partsDraw.gyroGetPointXArray[gyroCount + 2],
                                    y3: partsDraw.gyroGetPointYArray[gyroCount + 2],
                                    x4: partsDraw.gyroGetPointXArray[gyroCount + 3],
                                    y4: partsDraw.gyroGetPointYArray[gyroCount + 3])
            view.addSubview(gyroDraw)
            gyroCount += 4
            backViewArray.append(4)
            flagDrawGyro = 0
            view.subviews.forEach {
                if $0 is SelectedCircle {
                    $0.removeFromSuperview()
                }
            }
        }

        /* Debug */
        //        let debug = self.arduinoUnoPointControl12_9.pointTranslate(pointX: tapLocation.x, pointY: tapLocation.y)
        //        SCLAlertView().showInfo("\(debug)")
        ////        logger.debug("\(debug)")
        //        /* Debug */
        ////        logger.info(tapLocation)
        //        logger.debug("X-cordinate: \(Double(tapLocation.x))")
        //        logger.debug("Y-cordinate: \(Double(tapLocation.y))")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

func judgeDevice(screenSizeHeight: Double) -> Int {
    if screenSizeHeight == 1024 { // Mini, iPad, iPad2
        return 1
    } else if screenSizeHeight == 2048 { // Mini2, Mini3, Mini4, iPad3, iPad4, Air, Air2, Pro9.7
        return 2
    } else if screenSizeHeight == 2224 { // Pro10.5
        return 3
    } else if screenSizeHeight == 2732 { // Pro12.9
        return 4
    } else { // Other
        return 0
    }
}

func selectedCircle(uiImageView: UIImageView, tapLocation: CGPoint) -> SelectedCircle {
    let arduinoUnoPointControl12_9 = ArduinoUnoPointControl12_9()
    let selectedCircle = SelectedCircle(frame: CGRect(x: 0, y: 0,
                                                      width: uiImageView.bounds.width,
                                                      height: uiImageView.bounds.height))
    selectedCircle.backgroundColor = UIColor.clear
    arduinoUnoPointControl12_9.coordinateTranslate(translatePoint: arduinoUnoPointControl12_9.pointTranslate(pointX: Double(tapLocation.x), pointY: Double(tapLocation.y)))
    selectedCircle.intoBoardPoint(startX: arduinoUnoPointControl12_9.coordinateNumberX, startY: arduinoUnoPointControl12_9.coordinateNumberY)
    return selectedCircle
}
