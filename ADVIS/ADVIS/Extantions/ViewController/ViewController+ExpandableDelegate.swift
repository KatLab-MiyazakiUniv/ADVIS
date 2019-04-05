//
//  ViewController+ExpandableDelegate.swift
//  ADVIS
//
//  Created by Tatsumi Nishida on 2018/08/23.
//  Copyright © 2018年 Tatsumi Nishida. All rights reserved.
//

import ExpandableCell
import Foundation
import SCLAlertView
import UIKit

private let expandableTableViewHeader: [String] = ["Arduino Board", "MODULE", "SETTINGS"]
private let expandableTableViewCell: [[String]] = [["Arduino Uno", "Arduino Leonard"],
                                                   ["ジャンパワイヤ", "LED", "抵抗器", "ジャイロセンサ"],
                                                   ["サーバーに送信", "サーバーから取得"]]
var wireDrawRan = 0
var ledDrawRan = 0
var resistorDrawRan = 0
var gyroDrawRan = 0
var naturalRan = 0
var gyroRan = 0
var dangerDrawRan = 0
var runRan = 0

// var arduinoUnoPointControl12_9 = ArduinoUnoPointControl12_9()
// var partsDraw = PartsDraw.partsDrawInstance
var partsDraw = PartsDraw()

extension ViewController: ExpandableDelegate {
    /**
     各セクションの個数を決める
     */
    func expandableTableView(_: ExpandableTableView, expandedCellsForRowAt indexPath: IndexPath) -> [UITableViewCell]? {
        switch indexPath.section {
        case 0:

            switch indexPath.row {
            case 0:
                let cell00 = tableView.dequeueReusableCell(withIdentifier: ExpandedCell.ID) as! ExpandedCell
                cell00.titleLabel.text = expandableTableViewCell[0][0]
                let cell01 = tableView.dequeueReusableCell(withIdentifier: ExpandedCell.ID) as! ExpandedCell
                cell01.titleLabel.text = expandableTableViewCell[0][1]
                return [cell00, cell01]

            case 1:
                let cell10 = tableView.dequeueReusableCell(withIdentifier: ExpandedCell.ID) as! ExpandedCell
                cell10.titleLabel.text = expandableTableViewCell[1][0]
                let cell11 = tableView.dequeueReusableCell(withIdentifier: ExpandedCell.ID) as! ExpandedCell
                cell11.titleLabel.text = expandableTableViewCell[1][1]
                let cell12 = tableView.dequeueReusableCell(withIdentifier: ExpandedCell.ID) as! ExpandedCell
                cell12.titleLabel.text = expandableTableViewCell[1][2]
                let cell13 = tableView.dequeueReusableCell(withIdentifier: ExpandedCell.ID) as! ExpandedCell
                cell13.titleLabel.text = expandableTableViewCell[1][3]
                return [cell10, cell11, cell12, cell13]

            case 2:
                let cell20 = tableView.dequeueReusableCell(withIdentifier: ExpandedCell.ID) as! ExpandedCell
                cell20.titleLabel.text = expandableTableViewCell[2][0]
                let cell21 = tableView.dequeueReusableCell(withIdentifier: ExpandedCell.ID) as! ExpandedCell
                cell21.titleLabel.text = expandableTableViewCell[2][1]
                return [cell20, cell21]

            default:
                break
            }
        default:
            break
        }
        return nil
    }

    /**
     各セクションの中の要素の高さを決定
     */
    func expandableTableView(_: ExpandableTableView, heightsForExpandedRowAt indexPath: IndexPath) -> [CGFloat]? {
        switch indexPath.section {
        case 0:
            switch indexPath.row {
            case 0:
                return [44, 44, 44]

            case 1:
                return [44, 44, 44, 44]

            case 2:
                return [44, 44, 44]

//            case 3:
//                return [44, 44, 44]

            default:
                break
            }
        default:
            break
        }
        return nil
    }

    /**
     セクションの数
     */
    func numberOfSections(in _: ExpandableTableView) -> Int {
        return 1
    }

    /**
     セクションのデータの個数
     */
    func expandableTableView(_: ExpandableTableView, numberOfRowsInSection _: Int) -> Int {
        return expandableTableViewHeader.count
    }

    func expandableTableView(_: ExpandableTableView, didSelectRowAt _: IndexPath) {
        //        print("didSelectRow:\(indexPath)")
    }

    func expandableTableView(_: ExpandableTableView, didSelectExpandedRowAt _: IndexPath) {
        //        print("didSelectExpandedRowAt:\(indexPath)")
    }

    /**
     タップ時の挙動
     */
    func expandableTableView(_: ExpandableTableView, expandedCell: UITableViewCell, didSelectExpandedRowAt indexPath: IndexPath) {
        if let cell = expandedCell as? ExpandedCell {
            log.info("\(cell.titleLabel.text ?? "")")
            let cellValue = cell.titleLabel.text ?? ""
            // log.info("\(indexPath.section)")
            log.info("\(indexPath.row)")
            if cellValue == "Arduino Uno" {
                // SCLAlertView().showInfo("\(cell.titleLabel.text ?? "")")
                arduinoImageView.image = UIImage(named: "arduino-uno-advis")
                SCLAlertView().showInfo("Arduino Unoを\n配置しました")

            } else if cellValue == "Arduino Leonard" {
                SCLAlertView().showInfo("Arduino Leonard")

            } else if cellValue == "ジャンパワイヤ" {
                if wireDrawRan == 1 {
                    wireDrawRan = 0
                    SCLAlertView().showInfo("ジャンパワイヤ\nOFF")
                } else if wireDrawRan == 0 {
                    wireDrawRan = 1
                    ledDrawRan = 0
                    resistorDrawRan = 0
                    gyroDrawRan = 0
                    SCLAlertView().showInfo("ジャンパワイヤ\nON")
                }

            } else if cellValue == "LED" {
                if ledDrawRan == 1 {
                    ledDrawRan = 0
                    SCLAlertView().showInfo("LED\nOFF")
                } else if ledDrawRan == 0 {
                    ledDrawRan = 1
                    wireDrawRan = 0
                    resistorDrawRan = 0
                    gyroDrawRan = 0
                    SCLAlertView().showInfo("LED\nON")
                }

            } else if cellValue == "抵抗器" {
                if resistorDrawRan == 1 {
                    resistorDrawRan = 0
                    SCLAlertView().showInfo("抵抗器\nOFF")
                } else if resistorDrawRan == 0 {
                    resistorDrawRan = 1
                    wireDrawRan = 0
                    ledDrawRan = 0
                    gyroDrawRan = 0
                    SCLAlertView().showInfo("抵抗器\nON")
                }

            } else if cellValue == "ジャイロセンサ" {
                if gyroDrawRan == 1 {
                    gyroDrawRan = 0
                    SCLAlertView().showInfo("ジャイロセンサ\nOFF")
                } else if gyroDrawRan == 0 {
                    gyroDrawRan = 1
                    wireDrawRan = 0
                    ledDrawRan = 0
                    resistorDrawRan = 0
                    SCLAlertView().showInfo("ジャイロセンサ\nON")
                }

            } else if cellValue == "サーバーに送信" {
                SCLAlertView().showInfo("サーバーに送信")
            } else if cellValue == "サーバーから取得" {
                SCLAlertView().showInfo("サーバーから取得")
            }
        }
    }

    /**
     Cellに値を設定
     */
    func expandableTableView(_: ExpandableTableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            switch indexPath.row {
            case 0:
                //                guard let cell = expandableTableView.dequeueReusableCell(withIdentifier: ExpandableCell2.ID) else { return UITableViewCell() }
                //                return cell
                let titleCell0 = tableView.dequeueReusableCell(withIdentifier: ExpandableCell2.ID) as! ExpandableCell2
                titleCell0.sectionLabel.text = expandableTableViewHeader[0]
                return titleCell0

            case 1:
                let titleCell1 = tableView.dequeueReusableCell(withIdentifier: ExpandableCell2.ID) as! ExpandableCell2
                titleCell1.sectionLabel.text = expandableTableViewHeader[1]
                return titleCell1

            case 2:
                let titleCell2 = tableView.dequeueReusableCell(withIdentifier: ExpandableCell2.ID) as! ExpandableCell2
                titleCell2.sectionLabel.text = expandableTableViewHeader[2]
                return titleCell2

            default:
                break
            }

        default:
            break
        }

        return UITableViewCell()
    }

    func expandableTableView(_: ExpandableTableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            switch indexPath.row {
            case 0, 1, 2, 3:
                return 66

            default:
                break
            }

        default:
            break
        }

        return 66
    }

    func expandableTableView(_ expandableTableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
        let cell = expandableTableView.cellForRow(at: indexPath)
        cell?.contentView.backgroundColor = #colorLiteral(red: 0.7176470588, green: 0.1098039216, blue: 0.1098039216, alpha: 1)
        cell?.backgroundColor = #colorLiteral(red: 0.7176470588, green: 0.1098039216, blue: 0.1098039216, alpha: 1)
    }

    func expandableTableView(_: UITableView, shouldHighlightRowAt _: IndexPath) -> Bool {
        return true
    }
}
