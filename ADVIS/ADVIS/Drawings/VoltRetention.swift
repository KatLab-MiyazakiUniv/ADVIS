//
//  VoltRetention.swift
//  ADVIS
//
//  Created by Tatsumi Nishida on 8/26/18.
//  Copyright © 2018 Tatsumi. All rights reserved.
//

import Foundation

class VoltRetention {
//    var partsDraw = PartsDraw()
    var flagPowerIn = 0
    var flagPartIn = 0
    var flagGndIn = 0

    var searchInput = 0
    var voltBoardNumber = 0
    var thirtyValue = 0
    var voltValue = 0
    var pinNumber = 0
    var pinNumberConnection = 0
    var pinValue = 0
    var thisValue = 0
    var returnPinValue = 0
    var returnControlNumber = 0

    var voltDrawStart = 0
    var voltDrawEnd = 0

    var voltControlArray = Array(repeating: 0, count: 90)
    var voltConnectedArray: [[Int]] = [[404], [405], [408], [409], [410], [411], [419], [420], [421], [422], [423], [424]]
    var voltInPinArray: [Int] = [412, 413, 414]

    /**
     powerピンまたはデジタルI/Oにパーツの接続があるかどうかを調べ、接続があった場合にはflagPowerInから1(Int)を返り値として返す
     - Parameter repeatNumber: 調べる番号
     - Returns: 0もしくは，1を返す
     */
    func voltPowerIn(repeatNumber: Int) -> Int {
        if flagPowerIn == 0 {
            voltControlArray[64] = 3
            voltControlArray[65] = 5
            voltControlArray[66] = 0
            voltControlArray[67] = 0
            voltControlArray[68] = 10
            voltControlArray[69] = 3
            voltControlArray[70] = 3
            voltControlArray[71] = 3
            voltControlArray[72] = 0
            voltControlArray[73] = 0
            voltControlArray[74] = 0

            voltControlArray[75] = 0
            voltControlArray[76] = 5
            voltControlArray[77] = 5
            voltControlArray[78] = 5
            voltControlArray[79] = 5
            voltControlArray[80] = 5
            voltControlArray[81] = 5
            voltControlArray[82] = 0
            voltControlArray[83] = 0
            voltControlArray[84] = 0
            voltControlArray[85] = 0
            voltControlArray[86] = 0
            voltControlArray[87] = 0
            voltControlArray[88] = 0
            voltControlArray[89] = 0

            searchInput = voltConnectedArray[repeatNumber][0]

            /* 404~418で動作しないようにする */
            if partsDraw.ledTranslatePointArray.firstIndex(of: searchInput) != nil {
                if partsDraw.ledTranslatePointArray.firstIndex(of: searchInput)! % 2 == 0 {
                    pinNumber = partsDraw.ledTranslatePointArray[partsDraw.ledTranslatePointArray.firstIndex(of: searchInput)! + 1]
                    flagPowerIn = 1
                    if searchInput == 404 || 409 ... 411 ~= searchInput {
                        voltValue = 3
                    } else if searchInput == 405 || 419 ... 424 ~= searchInput {
                        voltValue = 5
                    } else if searchInput == 408 {
                        voltValue = 10
                    } else {
                        voltValue = 0
                    }
                    flagPowerIn = 1
                } else {
                    pinNumber = partsDraw.ledTranslatePointArray[partsDraw.ledTranslatePointArray.firstIndex(of: searchInput)! + 1]
                    if searchInput == 404 || 409 ... 411 ~= searchInput {
                        voltValue = 3
                    } else if searchInput == 405 || 419 ... 424 ~= searchInput {
                        voltValue = 5
                    } else if searchInput == 408 {
                        voltValue = 10
                    } else {
                        flagPowerIn = 0
                    }
                    flagPowerIn = 1
                }
            }

            if partsDraw.wireTranslatePointArray.firstIndex(of: searchInput) != nil {
                if partsDraw.wireTranslatePointArray.firstIndex(of: searchInput)! % 2 == 0 {
                    pinNumber = partsDraw.wireTranslatePointArray[partsDraw.wireTranslatePointArray.firstIndex(of: searchInput)! + 1]

                    if searchInput == 404 || 409 ... 411 ~= searchInput {
                        voltValue = 3
                    } else if searchInput == 405 || 419 ... 424 ~= searchInput {
                        voltValue = 5
                    } else if searchInput == 408 {
                        voltValue = 10
                    } else {
                        voltValue = 0
                    }
                    flagPowerIn = 1
                } else {
                    pinNumber = partsDraw.wireTranslatePointArray[partsDraw.wireTranslatePointArray.firstIndex(of: searchInput)! - 1]
                    if searchInput == 404 || 409 ... 411 ~= searchInput {
                        voltValue = 3
                    } else if searchInput == 405 || 419 ... 424 ~= searchInput {
                        voltValue = 5
                    } else if searchInput == 408 {
                        voltValue = 10
                    } else {
                        voltValue = 0
                    }
                    flagPowerIn = 1
                }
            }

            if partsDraw.resistorTranslatePointArray.firstIndex(of: searchInput) != nil {
                if partsDraw.resistorTranslatePointArray.firstIndex(of: searchInput)! % 2 == 0 {
                    pinNumber = partsDraw.resistorTranslatePointArray[partsDraw.resistorTranslatePointArray.firstIndex(of: searchInput)! + 1]

                    if searchInput == 404 || 409 ... 411 ~= searchInput {
                        voltValue = 3
                    } else if searchInput == 405 || 419 ... 424 ~= searchInput {
                        voltValue = 5
                    } else if searchInput == 408 {
                        voltValue = 10
                    } else {
                        voltValue = 0
                    }
                    flagPowerIn = 1
                } else {
                    pinNumber = partsDraw.resistorTranslatePointArray[partsDraw.resistorTranslatePointArray.firstIndex(of: searchInput)! + 1]
                    if searchInput == 404 || 409 ... 411 ~= searchInput {
                        voltValue = 3
                    } else if searchInput == 405 || 419 ... 424 ~= searchInput {
                        voltValue = 5
                    } else if searchInput == 408 {
                        voltValue = 10
                    } else {
                        voltValue = 0
                    }
                    flagPowerIn = 1
                }
            }
        }
        for iSearch in 0 ..< repeatNumber {
            if voltConnectedArray[iSearch].firstIndex(of: pinNumber) != nil && repeatNumber != 0 {
                pinNumber = 0
            }
        }
        if pinNumber != 0 {
            voltConnectedArray[repeatNumber].append(pinNumber)
        }
        return pinNumber
    }

    /*
     voltConnection
     2:パーツによって接続されているピンを調べる
     inPinNumber:pinNumberを引数として撮ってきて使う形にしたい(願望)
     */

    func voltConnection(inPinNumber: Int, repeatNumber: Int) -> Int {
        if pinNumber != 0 {
            /* inPinNumberが描画用配列の何番目かを調べる */
            if partsDraw.wireTranslatePointArray.firstIndex(of: inPinNumber) != nil {
                pinNumberConnection = partsDraw.wireTranslatePointArray.firstIndex(of: inPinNumber)!
                /* 接続先を調べる */
                if pinNumberConnection == 0 {
                    pinValue = partsDraw.wireTranslatePointArray[pinNumberConnection + 1]
                } else if pinNumberConnection % 2 == 0 {
                    pinValue = partsDraw.wireTranslatePointArray[pinNumberConnection + 1]
                } else {
                    pinValue = partsDraw.wireTranslatePointArray[pinNumberConnection - 1]
                }

            } else if partsDraw.ledTranslatePointArray.firstIndex(of: inPinNumber) != nil {
                pinNumberConnection = partsDraw.ledTranslatePointArray.firstIndex(of: inPinNumber)!
                /* 接続先を調べる */
                if pinNumberConnection == 0 {
                    pinValue = partsDraw.ledTranslatePointArray[pinNumberConnection + 1]
                } else if pinNumberConnection % 2 == 0 {
                    pinValue = partsDraw.ledTranslatePointArray[pinNumberConnection + 1]
                } else {
                    pinValue = partsDraw.ledTranslatePointArray[pinNumberConnection - 1]
                }

            } else if partsDraw.resistorTranslatePointArray.firstIndex(of: inPinNumber) != nil {
                pinNumberConnection = partsDraw.resistorTranslatePointArray.firstIndex(of: inPinNumber)!
                /* 接続先を調べる */
                if pinNumberConnection == 0 {
                    pinValue = partsDraw.resistorTranslatePointArray[pinNumberConnection + 1]
                } else if pinNumberConnection % 2 == 0 {
                    pinValue = partsDraw.resistorTranslatePointArray[pinNumberConnection + 1]
                } else {
                    pinValue = partsDraw.resistorTranslatePointArray[pinNumberConnection - 1]
                }
            }
//            else if partsDraw.gyroTranslatePointArray.index(of: inPinNumber) != nil {
//                pinNumberConnection = partsDraw.gyroTranslatePointArray.index(of: inPinNumber)!
//                if pinNumberConnection == 4 && pinValue == 0 {
            ////                    for iGyro in 1..<5 {
            ////                        if voltConnectedArray[repeatNumber].index(of: partsDraw.gyroTranslatePointArray[pinNumberConnection - iGyro]) == nil {
            ////
            ////                        }
            ////                    }
//                } else if pinNumberConnection == 3 && pinValue == 0 {
            ////                    for iGyro in 0..<4 {
            ////                        if voltConnectedArray[repeatNumber].index(of: partsDraw.gyroTranslatePointArray[pinNumberConnection - iGyro]) == nil {
            ////
            ////                        }
            ////                    }
//                } else if pinNumberConnection == 2 && pinValue == 0 {
            ////                    for iGyro in 0..<4 {
            ////                        if voltConnectedArray[repeatNumber].index(of: partsDraw.gyroTranslatePointArray[pinNumberConnection + 1 - iGyro]) == nil {
            ////
            ////                        }
            ////                    }
//                } else if pinNumberConnection == 1 && pinValue == 0 {
            ////                    for iGyro in 0..<4 {
            ////                        if voltConnectedArray[repeatNumber].index(of: partsDraw.gyroTranslatePointArray[pinNumberConnection + 2 - iGyro]) == nil {
            ////
            ////                        }
            ////                    }
//                }
//            }
        }
        if voltConnectedArray[repeatNumber].firstIndex(of: pinValue) == nil {
            voltConnectedArray[repeatNumber].append(pinValue)
        }
        return pinValue
    }

    /*
     voltSearchNearConnection:同じ行or列の接続を調べる
     inPinValue:調べたい行or列の中のピンの番号
     返り値:行or列内の接続のあるピンの番号。ない場合は0を返す
     */
    func voltSearchNearConnection(inPinValue: Int, repeatNumber: Int) -> Int {
        if inPinValue != 0 && returnPinValue == 0 {
            if voltConnectedArray[repeatNumber].firstIndex(of: inPinValue) == nil {
                voltConnectedArray[repeatNumber].append(inPinValue)
            }
            // プラス，マイナス行の管理
            if 1 ... 25 ~= inPinValue {
                thirtyValue = 0
                for i in 1 ..< 26 {
                    if partsDraw.wireTranslatePointArray.firstIndex(of: i) != nil && voltConnectedArray[repeatNumber].firstIndex(of: i) == nil {
                        returnPinValue = i
                    } else if partsDraw.ledTranslatePointArray.firstIndex(of: i) != nil && voltConnectedArray[repeatNumber].firstIndex(of: i) == nil {
                        returnPinValue = i
                    } else if partsDraw.resistorTranslatePointArray.firstIndex(of: i) != nil && voltConnectedArray[repeatNumber].firstIndex(of: i) == nil {
                        returnPinValue = i
                    } else if partsDraw.gyroTranslatePointArray.firstIndex(of: i) != nil && voltConnectedArray[repeatNumber].firstIndex(of: i) == nil {
                        returnPinValue = i
                    }
                }
            } else if 26 ... 50 ~= inPinValue {
                for i in 26 ..< 51 {
                    if partsDraw.wireTranslatePointArray.firstIndex(of: i) != nil && voltConnectedArray[repeatNumber].firstIndex(of: i) == nil {
                        returnPinValue = i
                    } else if partsDraw.ledTranslatePointArray.firstIndex(of: i) != nil && voltConnectedArray[repeatNumber].firstIndex(of: i) == nil {
                        returnPinValue = i
                    } else if partsDraw.resistorTranslatePointArray.firstIndex(of: i) != nil && voltConnectedArray[repeatNumber].firstIndex(of: i) == nil {
                        returnPinValue = i
                    } else if partsDraw.gyroTranslatePointArray.firstIndex(of: i) != nil && voltConnectedArray[repeatNumber].firstIndex(of: i) == nil {
                        returnPinValue = i
                    }
                }
            } else if 351 ... 375 ~= inPinValue {
                for i in 351 ..< 376 {
                    if partsDraw.wireTranslatePointArray.firstIndex(of: i) != nil && voltConnectedArray[repeatNumber].firstIndex(of: i) == nil {
                        returnPinValue = i
                    } else if partsDraw.ledTranslatePointArray.firstIndex(of: i) != nil && voltConnectedArray[repeatNumber].firstIndex(of: i) == nil {
                        returnPinValue = i
                    } else if partsDraw.resistorTranslatePointArray.firstIndex(of: i) != nil && voltConnectedArray[repeatNumber].firstIndex(of: i) == nil {
                        returnPinValue = i
                    } else if partsDraw.gyroTranslatePointArray.firstIndex(of: i) != nil && voltConnectedArray[repeatNumber].firstIndex(of: i) == nil {
                        returnPinValue = i
                    }
                }
            } else if 376 ... 400 ~= inPinValue {
                for i in 376 ..< 401 {
                    if partsDraw.wireTranslatePointArray.firstIndex(of: i) != nil && voltConnectedArray[repeatNumber].firstIndex(of: i) == nil {
                        returnPinValue = i
                    } else if partsDraw.ledTranslatePointArray.firstIndex(of: i) != nil && voltConnectedArray[repeatNumber].firstIndex(of: i) == nil {
                        returnPinValue = i
                    } else if partsDraw.resistorTranslatePointArray.firstIndex(of: i) != nil && voltConnectedArray[repeatNumber].firstIndex(of: i) == nil {
                        returnPinValue = i
                    } else if partsDraw.gyroTranslatePointArray.firstIndex(of: i) != nil && voltConnectedArray[repeatNumber].firstIndex(of: i) == nil {
                        returnPinValue = i
                    }
                }
            }

            /* f~j列の管理 */
            if 51 ... 200 ~= inPinValue {
                if 51 ... 80 ~= inPinValue {
                    for _ in 0 ..< 5 {
                        if partsDraw.wireTranslatePointArray.firstIndex(of: inPinValue + thirtyValue) != nil
                            && voltConnectedArray[repeatNumber].firstIndex(of: inPinValue + thirtyValue) == nil {
                            returnPinValue = inPinValue + thirtyValue
                        } else if partsDraw.ledTranslatePointArray.firstIndex(of: inPinValue + thirtyValue) != nil
                            && voltConnectedArray[repeatNumber].firstIndex(of: inPinValue + thirtyValue) == nil {
                            returnPinValue = inPinValue + thirtyValue
                        } else if partsDraw.resistorTranslatePointArray.firstIndex(of: inPinValue + thirtyValue) != nil
                            && voltConnectedArray[repeatNumber].firstIndex(of: inPinValue + thirtyValue) == nil {
                            returnPinValue = inPinValue + thirtyValue
                        } else if partsDraw.gyroTranslatePointArray.firstIndex(of: inPinValue + thirtyValue) != nil
                            && voltConnectedArray[repeatNumber].firstIndex(of: inPinValue + thirtyValue) == nil {
                            returnPinValue = inPinValue + thirtyValue
                        }
                        thirtyValue += 30
                    }
                } else if 81 ... 110 ~= inPinValue {
                    thirtyValue = -30
                    for _ in 0 ..< 5 {
                        if partsDraw.wireTranslatePointArray.firstIndex(of: inPinValue + thirtyValue) != nil
                            && voltConnectedArray[repeatNumber].firstIndex(of: inPinValue + thirtyValue) == nil {
                            returnPinValue = inPinValue + thirtyValue
                        } else if partsDraw.ledTranslatePointArray.firstIndex(of: inPinValue + thirtyValue) != nil
                            && voltConnectedArray[repeatNumber].firstIndex(of: inPinValue + thirtyValue) == nil {
                            returnPinValue = inPinValue + thirtyValue
                        } else if partsDraw.resistorTranslatePointArray.firstIndex(of: inPinValue + thirtyValue) != nil
                            && voltConnectedArray[repeatNumber].firstIndex(of: inPinValue + thirtyValue) == nil {
                            returnPinValue = inPinValue + thirtyValue
                        } else if partsDraw.gyroTranslatePointArray.firstIndex(of: inPinValue + thirtyValue) != nil
                            && voltConnectedArray[repeatNumber].firstIndex(of: inPinValue + thirtyValue) == nil {
                            returnPinValue = inPinValue + thirtyValue
                        }
                        thirtyValue += 30
                    }
                } else if 111 ... 140 ~= inPinValue {
                    thirtyValue = -60
                    for _ in 0 ..< 5 {
                        if partsDraw.wireTranslatePointArray.firstIndex(of: inPinValue + thirtyValue) != nil
                            && voltConnectedArray[repeatNumber].firstIndex(of: inPinValue + thirtyValue) == nil {
                            returnPinValue = inPinValue + thirtyValue
                        } else if partsDraw.ledTranslatePointArray.firstIndex(of: inPinValue + thirtyValue) != nil
                            && voltConnectedArray[repeatNumber].firstIndex(of: inPinValue + thirtyValue) == nil {
                            returnPinValue = inPinValue + thirtyValue
                        } else if partsDraw.resistorTranslatePointArray.firstIndex(of: inPinValue + thirtyValue) != nil
                            && voltConnectedArray[repeatNumber].firstIndex(of: inPinValue + thirtyValue) == nil {
                            returnPinValue = inPinValue + thirtyValue
                        } else if partsDraw.gyroTranslatePointArray.firstIndex(of: inPinValue + thirtyValue) != nil
                            && voltConnectedArray[repeatNumber].firstIndex(of: inPinValue + thirtyValue) == nil {
                            returnPinValue = inPinValue + thirtyValue
                        }
                        thirtyValue += 30
                    }
                } else if 141 ... 170 ~= inPinValue {
                    thirtyValue = -90
                    for _ in 0 ..< 5 {
                        if partsDraw.wireTranslatePointArray.firstIndex(of: inPinValue + thirtyValue) != nil
                            && voltConnectedArray[repeatNumber].firstIndex(of: inPinValue + thirtyValue) == nil {
                            returnPinValue = inPinValue + thirtyValue
                        } else if partsDraw.ledTranslatePointArray.firstIndex(of: inPinValue + thirtyValue) != nil
                            && voltConnectedArray[repeatNumber].firstIndex(of: inPinValue + thirtyValue) == nil {
                            returnPinValue = inPinValue + thirtyValue
                        } else if partsDraw.resistorTranslatePointArray.firstIndex(of: inPinValue + thirtyValue) != nil
                            && voltConnectedArray[repeatNumber].firstIndex(of: inPinValue + thirtyValue) == nil {
                            returnPinValue = inPinValue + thirtyValue
                        } else if partsDraw.gyroTranslatePointArray.firstIndex(of: inPinValue + thirtyValue) != nil
                            && voltConnectedArray[repeatNumber].firstIndex(of: inPinValue + thirtyValue) == nil {
                            returnPinValue = inPinValue + thirtyValue
                        }
                        thirtyValue += 30
                    }
                } else if 171 ... 200 ~= inPinValue {
                    thirtyValue = -120
                    for _ in 0 ..< 5 {
                        if partsDraw.wireTranslatePointArray.firstIndex(of: inPinValue + thirtyValue) != nil
                            && voltConnectedArray[repeatNumber].firstIndex(of: inPinValue + thirtyValue) == nil {
                            returnPinValue = inPinValue + thirtyValue
                        } else if partsDraw.ledTranslatePointArray.firstIndex(of: inPinValue + thirtyValue) != nil
                            && voltConnectedArray[repeatNumber].firstIndex(of: inPinValue + thirtyValue) == nil {
                            returnPinValue = inPinValue + thirtyValue
                        } else if partsDraw.resistorTranslatePointArray.firstIndex(of: inPinValue + thirtyValue) != nil
                            && voltConnectedArray[repeatNumber].firstIndex(of: inPinValue + thirtyValue) == nil {
                            returnPinValue = inPinValue + thirtyValue
                        } else if partsDraw.gyroTranslatePointArray.firstIndex(of: inPinValue + thirtyValue) != nil
                            && voltConnectedArray[repeatNumber].firstIndex(of: inPinValue + thirtyValue) == nil {
                            returnPinValue = inPinValue + thirtyValue
                        }
                        thirtyValue += 30
                    }
                }
            }

            /* a~e列の管理 */
            if 201 ... 350 ~= inPinValue {
                if 201 ... 230 ~= inPinValue {
                    for _ in 0 ..< 5 {
                        if partsDraw.wireTranslatePointArray.firstIndex(of: inPinValue + thirtyValue) != nil
                            && voltConnectedArray[repeatNumber].firstIndex(of: inPinValue + thirtyValue) == nil {
                            returnPinValue = inPinValue + thirtyValue
                        } else if partsDraw.ledTranslatePointArray.firstIndex(of: inPinValue + thirtyValue) != nil
                            && voltConnectedArray[repeatNumber].firstIndex(of: inPinValue + thirtyValue) == nil {
                            returnPinValue = inPinValue + thirtyValue
                        } else if partsDraw.resistorTranslatePointArray.firstIndex(of: inPinValue + thirtyValue) != nil
                            && voltConnectedArray[repeatNumber].firstIndex(of: inPinValue + thirtyValue) == nil {
                            returnPinValue = inPinValue + thirtyValue
                        } else if partsDraw.gyroTranslatePointArray.firstIndex(of: inPinValue + thirtyValue) != nil
                            && voltConnectedArray[repeatNumber].firstIndex(of: inPinValue + thirtyValue) == nil {
                            returnPinValue = inPinValue + thirtyValue
                        }
                        thirtyValue += 30
                    }
                } else if 231 ... 260 ~= inPinValue {
                    thirtyValue = -30
                    for _ in 0 ..< 5 {
                        if partsDraw.wireTranslatePointArray.firstIndex(of: inPinValue + thirtyValue) != nil
                            && voltConnectedArray[repeatNumber].firstIndex(of: inPinValue + thirtyValue) == nil {
                            returnPinValue = inPinValue + thirtyValue
                        } else if partsDraw.ledTranslatePointArray.firstIndex(of: inPinValue + thirtyValue) != nil
                            && voltConnectedArray[repeatNumber].firstIndex(of: inPinValue + thirtyValue) == nil {
                            returnPinValue = inPinValue + thirtyValue
                        } else if partsDraw.resistorTranslatePointArray.firstIndex(of: inPinValue + thirtyValue) != nil
                            && voltConnectedArray[repeatNumber].firstIndex(of: inPinValue + thirtyValue) == nil {
                            returnPinValue = inPinValue + thirtyValue
                        } else if partsDraw.gyroTranslatePointArray.firstIndex(of: inPinValue + thirtyValue) != nil
                            && voltConnectedArray[repeatNumber].firstIndex(of: inPinValue + thirtyValue) == nil {
                            returnPinValue = inPinValue + thirtyValue
                        }
                        thirtyValue += 30
                    }
                } else if 261 ... 290 ~= inPinValue {
                    thirtyValue = -60
                    for _ in 0 ..< 5 {
                        if partsDraw.wireTranslatePointArray.firstIndex(of: inPinValue + thirtyValue) != nil
                            && voltConnectedArray[repeatNumber].firstIndex(of: inPinValue + thirtyValue) == nil {
                            returnPinValue = inPinValue + thirtyValue
                        } else if partsDraw.ledTranslatePointArray.firstIndex(of: inPinValue + thirtyValue) != nil
                            && voltConnectedArray[repeatNumber].firstIndex(of: inPinValue + thirtyValue) == nil {
                            returnPinValue = inPinValue + thirtyValue
                        } else if partsDraw.resistorTranslatePointArray.firstIndex(of: inPinValue + thirtyValue) != nil
                            && voltConnectedArray[repeatNumber].firstIndex(of: inPinValue + thirtyValue) == nil {
                            returnPinValue = inPinValue + thirtyValue
                        } else if partsDraw.gyroTranslatePointArray.firstIndex(of: inPinValue + thirtyValue) != nil
                            && voltConnectedArray[repeatNumber].firstIndex(of: inPinValue + thirtyValue) == nil {
                            returnPinValue = inPinValue + thirtyValue
                        }
                        thirtyValue += 30
                    }
                } else if 291 ... 320 ~= inPinValue {
                    thirtyValue = -90
                    for _ in 0 ..< 5 {
                        if partsDraw.wireTranslatePointArray.firstIndex(of: inPinValue + thirtyValue) != nil
                            && voltConnectedArray[repeatNumber].firstIndex(of: inPinValue + thirtyValue) == nil {
                            returnPinValue = inPinValue + thirtyValue
                        } else if partsDraw.ledTranslatePointArray.firstIndex(of: inPinValue + thirtyValue) != nil
                            && voltConnectedArray[repeatNumber].firstIndex(of: inPinValue + thirtyValue) == nil {
                            returnPinValue = inPinValue + thirtyValue
                        } else if partsDraw.resistorTranslatePointArray.firstIndex(of: inPinValue + thirtyValue) != nil
                            && voltConnectedArray[repeatNumber].firstIndex(of: inPinValue + thirtyValue) == nil {
                            returnPinValue = inPinValue + thirtyValue
                        } else if partsDraw.gyroTranslatePointArray.firstIndex(of: inPinValue + thirtyValue) != nil
                            && voltConnectedArray[repeatNumber].firstIndex(of: inPinValue + thirtyValue) == nil {
                            returnPinValue = inPinValue + thirtyValue
                        }
                        thirtyValue += 30
                    }
                } else if 321 ... 350 ~= inPinValue {
                    thirtyValue = -120
                    for _ in 0 ..< 5 {
                        if partsDraw.wireTranslatePointArray.firstIndex(of: inPinValue + thirtyValue) != nil
                            && voltConnectedArray[repeatNumber].firstIndex(of: inPinValue + thirtyValue) == nil {
                            returnPinValue = inPinValue + thirtyValue
                        } else if partsDraw.ledTranslatePointArray.firstIndex(of: inPinValue + thirtyValue) != nil
                            && voltConnectedArray[repeatNumber].firstIndex(of: inPinValue + thirtyValue) == nil {
                            returnPinValue = inPinValue + thirtyValue
                        } else if partsDraw.resistorTranslatePointArray.firstIndex(of: inPinValue + thirtyValue) != nil
                            && voltConnectedArray[repeatNumber].firstIndex(of: inPinValue + thirtyValue) == nil {
                            returnPinValue = inPinValue + thirtyValue
                        } else if partsDraw.gyroTranslatePointArray.firstIndex(of: inPinValue + thirtyValue) != nil
                            && voltConnectedArray[repeatNumber].firstIndex(of: inPinValue + thirtyValue) == nil {
                            returnPinValue = inPinValue + thirtyValue
                        }
                        thirtyValue += 30
                    }
                }
            }
        }
        if voltConnectedArray[repeatNumber].firstIndex(of: returnPinValue) == nil && returnPinValue != 0 {
            voltConnectedArray[repeatNumber].append(returnPinValue)
        }
        return returnPinValue
    }

    /* ボード上の電圧管理 */
    func voltValueControl(pinNumber: Int) {
        if pinNumber < 401 {
            /* プラス，マイナス行の管理 */
            if 1 ... 25 ~= pinNumber {
                voltControlArray[60] = voltValue
                voltBoardNumber = 60
            } else if 26 ... 50 ~= pinNumber {
                voltControlArray[61] = voltValue
                voltBoardNumber = 61
            } else if 351 ... 375 ~= pinNumber {
                voltControlArray[62] = voltValue
                voltBoardNumber = 62
            } else if 376 ... 400 ~= pinNumber {
                voltControlArray[63] = voltValue
                voltBoardNumber = 63
            }

            /* f~j */
            for i in 0 ..< 30 {
                if pinNumber == 51 + i || pinNumber == 81 + i || pinNumber == 111 + i
                    || pinNumber == 141 + i || pinNumber == 171 + i {
                    voltControlArray[i] = voltValue
                    voltBoardNumber = i
                }
            }

            /* a~e */
            for i in 30 ..< 60 {
                if pinNumber == 171 + i || pinNumber == 201 + i || pinNumber == 231 + i
                    || pinNumber == 261 + i || pinNumber == 291 + i {
                    voltControlArray[i] = voltValue
                    voltBoardNumber = i
                }
            }
        }
    }

    /*
     VoltControlの値を取ってくるやつ
     bordNumber:ボード番号
     thisValue
     */
    func voltReturnValue(boardNumber: Int) -> Int {
        if boardNumber < 401 {
            /* プラス，マイナス行の管理 */
            if 1 ... 25 ~= boardNumber {
                thisValue = voltControlArray[60]
            } else if 26 ... 50 ~= boardNumber {
                thisValue = voltControlArray[61]
            } else if 351 ... 375 ~= boardNumber {
                thisValue = voltControlArray[62]
            } else if 376 ... 400 ~= boardNumber {
                thisValue = voltControlArray[63]
            }

            /* f~j列の管理 */
            for i in 0 ..< 30 {
                if boardNumber == 51 + i || boardNumber == 81 + i || boardNumber == 111 + i
                    || boardNumber == 141 + i || boardNumber == 171 + i {
                    thisValue = voltControlArray[i]
                }
            }

            /* a~e列の管理 */
            for i in 30 ..< 60 {
                if boardNumber == 171 + i || boardNumber == 201 + i || boardNumber == 231 + i
                    || boardNumber == 261 + i || boardNumber == 291 + i {
                    thisValue = voltControlArray[i]
                }
            }
        }
        return thisValue
    }

    /*
     VoltControlArrayのやつを変換用
     voltTransNumber:controlArray内の番号
     */
    func voltBoardTranslate(voltTransNumber: Int) {
        if 0 ... 29 ~= voltTransNumber {
            for i in 0 ..< 30 {
                if voltTransNumber == i {
                    voltDrawStart = 51 + i
                    voltDrawEnd = 171 + i
                }
            }
        } else if 30 ... 59 ~= voltTransNumber {
            for i in 0 ..< 30 {
                if voltTransNumber == 30 + i {
                    voltDrawStart = 201 + i
                    voltDrawEnd = 321 + i
                }
            }
        } else if voltTransNumber == 60 {
            voltDrawStart = 1
            voltDrawEnd = 25
        } else if voltTransNumber == 61 {
            voltDrawStart = 26
            voltDrawEnd = 50
        } else if voltTransNumber == 62 {
            voltDrawStart = 351
            voltDrawEnd = 375
        } else if voltTransNumber == 63 {
            voltDrawStart = 376
            voltDrawEnd = 400
        }
    }

    func voltControlNumberBack(boardNumber: Int) -> Int {
        if boardNumber < 401 {
            /* f~j列の管理 */
            for i in 0 ..< 30 {
                if boardNumber == 51 + i || boardNumber == 81 + i || boardNumber == 111 + i
                    || boardNumber == 141 + i || boardNumber == 171 + i {
                    returnControlNumber = i
                }
            }
            /* a~e列の管理 */
            for i in 30 ..< 60 {
                if boardNumber == 171 + i || boardNumber == 201 + i || boardNumber == 231 + i
                    || boardNumber == 261 + i || boardNumber == 291 + i {
                    returnControlNumber = i
                }
            }
        }
        return returnControlNumber
    }
}
