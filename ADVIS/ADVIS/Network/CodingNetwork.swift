//
// Created by T.N.Revolution on 2020/01/06.
// Copyright (c) 2020 T.N.Revolution All rights reserved.
//

import Alamofire
import Foundation
import SwiftyJSON

struct ArduinoPinStatus: Codable {
    var digitalPin00: PinStatus = PinStatus() // 00
    var digitalPin01: PinStatus = PinStatus() // 01
    var digitalPin02: PinStatus = PinStatus() // 02
    var digitalPin03: PinStatus = PinStatus() // 03
    var digitalPin04: PinStatus = PinStatus() // 04
    var digitalPin05: PinStatus = PinStatus() // 05
    var digitalPin06: PinStatus = PinStatus() // 06
    var digitalPin07: PinStatus = PinStatus() // 07
    var digitalPin08: PinStatus = PinStatus() // 08
    var digitalPin09: PinStatus = PinStatus() // 09
    var digitalPin10: PinStatus = PinStatus() // 10
    var digitalPin11: PinStatus = PinStatus() // 11
    var digitalPin12: PinStatus = PinStatus() // 12
    var digitalPin13: PinStatus = PinStatus() // 13
    var GND0: PinStatus = PinStatus()
    var AREF: PinStatus = PinStatus()
    var serialDataLine12C: PinStatus = PinStatus()
    var serialClockLine12C: PinStatus = PinStatus()
    var analogPin00: PinStatus = PinStatus() // 14
    var analogPin01: PinStatus = PinStatus() // 15
    var analogPin02: PinStatus = PinStatus() // 16
    var analogPin03: PinStatus = PinStatus() // 17
    var analogPin04: PinStatus = PinStatus() // 18
    var analogPin05: PinStatus = PinStatus() // 19
    var vin: PinStatus = PinStatus(isLow: false, isInput: false, voltValue: 10.0)
    var GND1: PinStatus = PinStatus()
    var GND2: PinStatus = PinStatus()
    var volt5_0v: PinStatus = PinStatus(isLow: false, isInput: false, voltValue: 5.0)
    var volt3_3v: PinStatus = PinStatus(isLow: false, isInput: false, voltValue: 3.0)
    var IOREF: PinStatus = PinStatus()
}

struct PinStatus: Codable {
    var isLow: Bool = true
    var isInput: Bool = true
    var voltValue: Double = 0.0
}

/// Heroku上のサーバーとPOST通信を行う
class CodingNetwork {
    let url: String
    let dispatchGroup = DispatchGroup()

    init() {
        url = "https://pure-reaches-27951.herokuapp.com//api/v1/arduino/parse"
    }

    /// POST通信を行う
    /// 成功すると辞書型に変換してstatic変数に代入
    func postCode(requestBody: String) {
//        self.dispatchGroup.enter() // 逐次処理的な
        let requestBody = ["sourceCode": requestBody]
//        var arduinoPinStatusDict: [String: PinStatus] = [:]
        Alamofire.request(url, method: .post, parameters: requestBody).validate().responseJSON { res in
            if res.result.isSuccess {
                let returnData = res.data
                let arduinoPinStatus = try? JSONDecoder().decode(ArduinoPinStatus.self, from: returnData!)
                VoltPin.dic = self.converArduinoPinStatusToDict(arduinoPinStatus: arduinoPinStatus!)
            } else {
                print("Error!")
            }
//            self.dispatchGroup.leave()
        }
//        return arduinoPinStatusDict
    }

    /// 構造体を辞書型に変換するメソッド
    private func converArduinoPinStatusToDict(arduinoPinStatus: ArduinoPinStatus) -> [String: PinStatus] {
        print("構造体を辞書型に変換します．")
        print("変換前: \n \(arduinoPinStatus)")
        let mirror = Mirror(reflecting: arduinoPinStatus)
        var arduinoPinStatusDict: [String: PinStatus] = [:]
        for child in mirror.children {
            print("Label: \(child.label!) Value: \(child.value)")
            arduinoPinStatusDict.updateValue(child.value as! PinStatus, forKey: child.label!)
        }
        print("変換結果: \n \(arduinoPinStatusDict)")
        return arduinoPinStatusDict
    }
}
