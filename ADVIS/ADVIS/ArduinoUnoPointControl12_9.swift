//
//  PointControl.swift
//  ADVIS
//
//  Created by Tatsumi Nishida on 2018/06/10.
//  Copyright © 2018年 Tatsumi Nishida. All rights reserved.
//

import Foundation
import UIKit

/// ArduinoUnoの座標をコントロールするクラス
class ArduinoUnoPointControl12_9 {
    var coordinateNumberX: Double = 0.0
    var coordinateNumberY: Double = 0.0

    /**
     タップされた座標に応じて特定の数字に変換

     - Parameter pointX: X座標
     - Parameter pointY: Y座標
     - Returns: 正しい座標がタップされると各ピンの番号を返す
     */
    func pointTranslate(pointX: Double, pointY: Double) -> Int {
        // Digital Pin
        if 54 ... 77 ~= pointY { //  Y-cordinate
            // X-cordinate
            if 490.5 ... 514 ~= pointX { // GND
                return 418
            } else if 530 ... 552.5 ~= pointX { // 13
                return 419
            } else if 569.5 ... 592.5 ~= pointX { // 12
                return 420
            } else if 610 ... 633.5 ~= pointX { // 11
                return 421
            } else if 649.5 ... 673 ~= pointX { // 10
                return 422
            } else if 686.5 ... 712 ~= pointX { // 9
                return 423
            } else if 725.5 ... 752 ~= pointX { // 8
                return 424

            } else if 790 ... 821 ~= pointX { // 7
                return 425
            } else if 832 ... 858 ~= pointX { // 6
                return 426
            } else if 869.5 ... 895 ~= pointX { // 5
                return 427
            } else if 909 ... 935 ~= pointX { // 4
                return 428
            } else if 950 ... 974.5 ~= pointX { // 3
                return 429
            } else if 988.5 ... 1014.5 ~= pointX { // 2
                return 430
            } else if 1027 ... 1053.5 ~= pointX { // 1
                return 431
            } else if 1065.5 ... 1091.5 ~= pointX { // 0
                return 432
            }
        }

        // AnalogPin
        if 972 ... 997 ~= pointY { // Y-cordinate
            // X-cordinate
            if 592.5 ... 618 ~= pointX { // 3.3V
                return 404
            } else if 632.5 ... 656.5 ~= pointX { // 5V
                return 405
            } else if 673 ... 697 ~= pointX { // GND
                return 406
            } else if 711.5 ... 732.5 ~= pointX { // GND
                return 407
            } else if 750.5 ... 775 ~= pointX { // Vin
                return 408

            } else if 828 ... 854.5 ~= pointX { // A0
                return 409
            } else if 870 ... 894 ~= pointX { // A1
                return 410
            } else if 909 ... 934 ~= pointX { // A2
                return 411
            } else if 949.5 ... 973.5 ~= pointX { // A3
                return 412
            } else if 986.5 ... 1012 ~= pointX { // A4
                return 413
            } else if 1025 ... 1051 ~= pointX { // A5
                return 414
            }
        }

        // Up Side -
        if 214 ... 226.5 ~= pointY { // Y-cordinate
            // X-cordinate
            if 114.5 ... 131.5 ~= pointX {
                return 1
            } else if 145.5 ... 161 ~= pointX {
                return 2
            } else if 175.5 ... 195 ~= pointX {
                return 3
            } else if 206.5 ... 224.5 ~= pointX {
                return 4
            } else if 237.5 ... 257.5 ~= pointX {
                return 5
            } else if 305 ... 325.5 ~= pointX {
                return 6
            } else if 336.5 ... 357 ~= pointX {
                return 7
            } else if 368 ... 388.5 ~= pointX {
                return 8
            } else if 400 ... 420 ~= pointX {
                return 9
            } else if 430 ... 449 ~= pointX {
                return 10
            } else if 501 ... 520.5 ~= pointX {
                return 11
            } else if 533 ... 552 ~= pointX {
                return 12
            } else if 563 ... 584 ~= pointX {
                return 13
            } else if 595 ... 614.5 ~= pointX {
                return 14
            } else if 624 ... 645.5 ~= pointX {
                return 15
            } else if 702 ... 721 ~= pointX {
                return 16
            } else if 732 ... 752 ~= pointX {
                return 17
            } else if 766 ... 785 ~= pointX {
                return 18
            } else if 794.5 ... 815.5 ~= pointX {
                return 19
            } else if 827 ... 847 ~= pointX {
                return 20
            } else if 902.5 ... 920.5 ~= pointX {
                return 21
            } else if 933 ... 953.5 ~= pointX {
                return 22
            } else if 966 ... 986 ~= pointX {
                return 23
            } else if 996 ... 1014 ~= pointX {
                return 24
            } else if 1026.5 ... 1047.5 ~= pointX {
                return 25
            }
        }

        // Up Side +
        if 247 ... 264 ~= pointY { // Y-cordinate
            // X-cordinate
            if 114.5 ... 131.5 ~= pointX {
                return 26
            } else if 145.5 ... 161 ~= pointX {
                return 27
            } else if 175.5 ... 195 ~= pointX {
                return 28
            } else if 206.5 ... 224.5 ~= pointX {
                return 29
            } else if 237.5 ... 257.5 ~= pointX {
                return 30
            } else if 305 ... 325.5 ~= pointX {
                return 31
            } else if 336.5 ... 357 ~= pointX {
                return 32
            } else if 368 ... 388.5 ~= pointX {
                return 33
            } else if 400 ... 420 ~= pointX {
                return 34
            } else if 430 ... 449 ~= pointX {
                return 35
            } else if 501 ... 520.5 ~= pointX {
                return 36
            } else if 533 ... 552 ~= pointX {
                return 37
            } else if 563 ... 584 ~= pointX {
                return 38
            } else if 595 ... 614.5 ~= pointX {
                return 39
            } else if 624 ... 645.5 ~= pointX {
                return 40
            } else if 702 ... 721 ~= pointX {
                return 41
            } else if 732 ... 752 ~= pointX {
                return 42
            } else if 766 ... 785 ~= pointX {
                return 43
            } else if 794.5 ... 815.5 ~= pointX {
                return 44
            } else if 827 ... 847 ~= pointX {
                return 45
            } else if 902.5 ... 920.5 ~= pointX {
                return 46
            } else if 933 ... 953.5 ~= pointX {
                return 47
            } else if 966 ... 986 ~= pointX {
                return 48
            } else if 996 ... 1014 ~= pointX {
                return 49
            } else if 1026.5 ... 1047.5 ~= pointX {
                return 50
            }
        }

        // Down Side -
        if 739 ... 756.5 ~= pointY {
            // X-cordinate
            if 114.5 ... 131.5 ~= pointX {
                return 351
            } else if 145.5 ... 161 ~= pointX {
                return 352
            } else if 175.5 ... 195 ~= pointX {
                return 353
            } else if 206.5 ... 224.5 ~= pointX {
                return 354
            } else if 237.5 ... 257.5 ~= pointX {
                return 355
            } else if 305 ... 325.5 ~= pointX {
                return 356
            } else if 336.5 ... 357 ~= pointX {
                return 357
            } else if 368 ... 388.5 ~= pointX {
                return 358
            } else if 400 ... 420 ~= pointX {
                return 359
            } else if 430 ... 449 ~= pointX {
                return 360
            } else if 501 ... 520.5 ~= pointX {
                return 361
            } else if 533 ... 552 ~= pointX {
                return 362
            } else if 563 ... 584 ~= pointX {
                return 363
            } else if 595 ... 614.5 ~= pointX {
                return 364
            } else if 624 ... 645.5 ~= pointX {
                return 365
            } else if 702 ... 721 ~= pointX {
                return 366
            } else if 732 ... 752 ~= pointX {
                return 367
            } else if 766 ... 785 ~= pointX {
                return 368
            } else if 794.5 ... 815.5 ~= pointX {
                return 369
            } else if 827 ... 847 ~= pointX {
                return 370
            } else if 902.5 ... 920.5 ~= pointX {
                return 371
            } else if 933 ... 953.5 ~= pointX {
                return 372
            } else if 966 ... 986 ~= pointX {
                return 373
            } else if 996 ... 1014 ~= pointX {
                return 374
            } else if 1026.5 ... 1047.5 ~= pointX {
                return 375
            }
        }

        // Down Side +
        if 774 ... 791 ~= pointY { // Y-cordinate
            // X-cordinate
            if 114.5 ... 131.5 ~= pointX {
                return 376
            } else if 145.5 ... 161 ~= pointX {
                return 377
            } else if 175.5 ... 195 ~= pointX {
                return 378
            } else if 206.5 ... 224.5 ~= pointX {
                return 379
            } else if 237.5 ... 257.5 ~= pointX {
                return 380
            } else if 305 ... 325.5 ~= pointX {
                return 381
            } else if 336.5 ... 357 ~= pointX {
                return 382
            } else if 368 ... 388.5 ~= pointX {
                return 383
            } else if 400 ... 420 ~= pointX {
                return 384
            } else if 430 ... 449 ~= pointX {
                return 385
            } else if 501 ... 520.5 ~= pointX {
                return 386
            } else if 533 ... 552 ~= pointX {
                return 387
            } else if 563 ... 584 ~= pointX {
                return 388
            } else if 595 ... 614.5 ~= pointX {
                return 389
            } else if 624 ... 645.5 ~= pointX {
                return 390
            } else if 702 ... 721 ~= pointX {
                return 391
            } else if 732 ... 752 ~= pointX {
                return 392
            } else if 766 ... 785 ~= pointX {
                return 393
            } else if 794.5 ... 815.5 ~= pointX {
                return 394
            } else if 827 ... 847 ~= pointX {
                return 395
            } else if 902.5 ... 920.5 ~= pointX {
                return 396
            } else if 933 ... 953.5 ~= pointX {
                return 397
            } else if 966 ... 986 ~= pointX {
                return 398
            } else if 996 ... 1014 ~= pointX {
                return 399
            } else if 1026.5 ... 1047.5 ~= pointX {
                return 400
            }
        }

        // Bread Board
        // j
        if 326.5 ... 346.5 ~= pointY { // Y-cordinate
            if 97.5 ... 117 ~= pointX { // 1
                return 51
            } else if 133 ... 151.5 ~= pointX { // 2
                return 52
            } else if 166 ... 186 ~= pointX { // 3
                return 53
            } else if 198 ... 217.5 ~= pointX { // 4
                return 54
            } else if 230.5 ... 251 ~= pointX { // 5
                return 55
            } else if 262 ... 283.5 ~= pointX { // 6
                return 56
            } else if 295 ... 316 ~= pointX { // 7
                return 57
            } else if 327 ... 347.5 ~= pointX { // 8
                return 58
            } else if 361.5 ... 380.5 ~= pointX { // 9
                return 59
            } else if 392.5 ... 412.5 ~= pointX { // 10
                return 60
            } else if 426.5 ... 445.5 ~= pointX { // 11
                return 61
            } else if 457.5 ... 479 ~= pointX { // 12
                return 62
            } else if 492.5 ... 515 ~= pointX { // 13
                return 63
            } else if 527 ... 548.5 ~= pointX { // 14
                return 64
            } else if 559 ... 580 ~= pointX { // 15
                return 65
            } else if 593 ... 613 ~= pointX { // 16
                return 66
            } else if 625 ... 645 ~= pointX { // 17
                return 67
            } else if 659.5 ... 679.5 ~= pointX { // 18
                return 68
            } else if 691.5 ... 711 ~= pointX { // 19
                return 69
            } else if 723 ... 743 ~= pointX { // 20
                return 70
            } else if 755.5 ... 775 ~= pointX { // 21
                return 71
            } else if 788 ... 809 ~= pointX { // 22
                return 72
            } else if 821.5 ... 844 ~= pointX { // 23
                return 73
            } else if 856.5 ... 878 ~= pointX { // 24
                return 74
            } else if 888 ... 911 ~= pointX { // 25
                return 75
            } else if 921.5 ... 944 ~= pointX { // 26
                return 76
            } else if 956 ... 978 ~= pointX { // 27
                return 77
            } else if 988.5 ... 1010.5 ~= pointX { // 28
                return 78
            } else if 1021 ... 1041 ~= pointX { // 29
                return 79
            } else if 1052.5 ... 1072.5 ~= pointX { // 30
                return 80
            }
        }

        // i
        if 357.5 ... 376.5 ~= pointY { // Y-cordinate
            if 97.5 ... 117 ~= pointX { // 1
                return 81
            } else if 133 ... 151.5 ~= pointX { // 2
                return 82
            } else if 166 ... 186 ~= pointX { // 3
                return 83
            } else if 198 ... 217.5 ~= pointX { // 4
                return 84
            } else if 230.5 ... 251 ~= pointX { // 5
                return 85
            } else if 262 ... 283.5 ~= pointX { // 6
                return 86
            } else if 295 ... 316 ~= pointX { // 7
                return 87
            } else if 327 ... 347.5 ~= pointX { // 8
                return 88
            } else if 361.5 ... 380.5 ~= pointX { // 9
                return 89
            } else if 392.5 ... 412.5 ~= pointX { // 10
                return 90
            } else if 426.5 ... 445.5 ~= pointX { // 11
                return 91
            } else if 457.5 ... 479 ~= pointX { // 12
                return 92
            } else if 492.5 ... 515 ~= pointX { // 13
                return 93
            } else if 527 ... 548.5 ~= pointX { // 14
                return 94
            } else if 559 ... 580 ~= pointX { // 15
                return 95
            } else if 593 ... 613 ~= pointX { // 16
                return 96
            } else if 625 ... 645 ~= pointX { // 17
                return 97
            } else if 659.5 ... 679.5 ~= pointX { // 18
                return 98
            } else if 691.5 ... 711 ~= pointX { // 19
                return 99
            } else if 723 ... 743 ~= pointX { // 20
                return 100
            } else if 755.5 ... 775 ~= pointX { // 21
                return 101
            } else if 788 ... 809 ~= pointX { // 22
                return 102
            } else if 821.5 ... 844 ~= pointX { // 23
                return 103
            } else if 856.5 ... 878 ~= pointX { // 24
                return 104
            } else if 888 ... 911 ~= pointX { // 25
                return 105
            } else if 921.5 ... 944 ~= pointX { // 26
                return 106
            } else if 956 ... 978 ~= pointX { // 27
                return 107
            } else if 988.5 ... 1010.5 ~= pointX { // 28
                return 108
            } else if 1021 ... 1041 ~= pointX { // 29
                return 109
            } else if 1052.5 ... 1072.5 ~= pointX { // 30
                return 110
            }
        }

        // h
        if 390 ... 408.5 ~= pointY { // Y-cordinate
            if 97.5 ... 117 ~= pointX { // 1
                return 111
            } else if 133 ... 151.5 ~= pointX { // 2
                return 112
            } else if 166 ... 186 ~= pointX { // 3
                return 113
            } else if 198 ... 217.5 ~= pointX { // 4
                return 114
            } else if 230.5 ... 251 ~= pointX { // 5
                return 115
            } else if 262 ... 283.5 ~= pointX { // 6
                return 116
            } else if 295 ... 316 ~= pointX { // 7
                return 117
            } else if 327 ... 347.5 ~= pointX { // 8
                return 118
            } else if 361.5 ... 380.5 ~= pointX { // 9
                return 119
            } else if 392.5 ... 412.5 ~= pointX { // 10
                return 120
            } else if 426.5 ... 445.5 ~= pointX { // 11
                return 121
            } else if 457.5 ... 479 ~= pointX { // 12
                return 122
            } else if 492.5 ... 515 ~= pointX { // 13
                return 123
            } else if 527 ... 548.5 ~= pointX { // 14
                return 124
            } else if 559 ... 580 ~= pointX { // 15
                return 125
            } else if 593 ... 613 ~= pointX { // 16
                return 126
            } else if 625 ... 645 ~= pointX { // 17
                return 127
            } else if 659.5 ... 679.5 ~= pointX { // 18
                return 128
            } else if 691.5 ... 711 ~= pointX { // 19
                return 129
            } else if 723 ... 743 ~= pointX { // 20
                return 130
            } else if 755.5 ... 775 ~= pointX { // 21
                return 131
            } else if 788 ... 809 ~= pointX { // 22
                return 132
            } else if 821.5 ... 844 ~= pointX { // 23
                return 133
            } else if 856.5 ... 878 ~= pointX { // 24
                return 134
            } else if 888 ... 911 ~= pointX { // 25
                return 135
            } else if 921.5 ... 944 ~= pointX { // 26
                return 136
            } else if 956 ... 978 ~= pointX { // 27
                return 137
            } else if 988.5 ... 1010.5 ~= pointX { // 28
                return 138
            } else if 1021 ... 1041 ~= pointX { // 29
                return 139
            } else if 1052.5 ... 1072.5 ~= pointX { // 30
                return 140
            }
        }

        // g
        if 420.5 ... 437.5 ~= pointY { // Y-cordinate
            if 97.5 ... 117 ~= pointX { // 1
                return 141
            } else if 133 ... 151.5 ~= pointX { // 2
                return 142
            } else if 166 ... 186 ~= pointX { // 3
                return 143
            } else if 198 ... 217.5 ~= pointX { // 4
                return 144
            } else if 230.5 ... 251 ~= pointX { // 5
                return 145
            } else if 262 ... 283.5 ~= pointX { // 6
                return 146
            } else if 295 ... 316 ~= pointX { // 7
                return 147
            } else if 327 ... 347.5 ~= pointX { // 8
                return 148
            } else if 361.5 ... 380.5 ~= pointX { // 9
                return 149
            } else if 392.5 ... 412.5 ~= pointX { // 10
                return 150
            } else if 426.5 ... 445.5 ~= pointX { // 11
                return 151
            } else if 457.5 ... 479 ~= pointX { // 12
                return 152
            } else if 492.5 ... 515 ~= pointX { // 13
                return 153
            } else if 527 ... 548.5 ~= pointX { // 14
                return 154
            } else if 559 ... 580 ~= pointX { // 15
                return 155
            } else if 593 ... 613 ~= pointX { // 16
                return 156
            } else if 625 ... 645 ~= pointX { // 17
                return 157
            } else if 659.5 ... 679.5 ~= pointX { // 18
                return 158
            } else if 691.5 ... 711 ~= pointX { // 19
                return 159
            } else if 723 ... 743 ~= pointX { // 20
                return 160
            } else if 755.5 ... 775 ~= pointX { // 21
                return 161
            } else if 788 ... 809 ~= pointX { // 22
                return 162
            } else if 821.5 ... 844 ~= pointX { // 23
                return 163
            } else if 856.5 ... 878 ~= pointX { // 24
                return 164
            } else if 888 ... 911 ~= pointX { // 25
                return 165
            } else if 921.5 ... 944 ~= pointX { // 26
                return 166
            } else if 956 ... 978 ~= pointX { // 27
                return 167
            } else if 988.5 ... 1010.5 ~= pointX { // 28
                return 168
            } else if 1021 ... 1041 ~= pointX { // 29
                return 169
            } else if 1052.5 ... 1072.5 ~= pointX { // 30
                return 170
            }
        }

        // f
        if 451 ... 467.5 ~= pointY { // Y-cordinate
            if 97.5 ... 117 ~= pointX { // 1
                return 171
            } else if 133 ... 151.5 ~= pointX { // 2
                return 172
            } else if 166 ... 186 ~= pointX { // 3
                return 173
            } else if 198 ... 217.5 ~= pointX { // 4
                return 174
            } else if 230.5 ... 251 ~= pointX { // 5
                return 175
            } else if 262 ... 283.5 ~= pointX { // 6
                return 176
            } else if 295 ... 316 ~= pointX { // 7
                return 177
            } else if 327 ... 347.5 ~= pointX { // 8
                return 178
            } else if 361.5 ... 380.5 ~= pointX { // 9
                return 179
            } else if 392.5 ... 412.5 ~= pointX { // 10
                return 180
            } else if 426.5 ... 445.5 ~= pointX { // 11
                return 181
            } else if 457.5 ... 479 ~= pointX { // 12
                return 182
            } else if 492.5 ... 515 ~= pointX { // 13
                return 183
            } else if 527 ... 548.5 ~= pointX { // 14
                return 184
            } else if 559 ... 580 ~= pointX { // 15
                return 185
            } else if 593 ... 613 ~= pointX { // 16
                return 186
            } else if 625 ... 645 ~= pointX { // 17
                return 187
            } else if 659.5 ... 679.5 ~= pointX { // 18
                return 188
            } else if 691.5 ... 711 ~= pointX { // 19
                return 189
            } else if 723 ... 743 ~= pointX { // 20
                return 190
            } else if 755.5 ... 775 ~= pointX { // 21
                return 191
            } else if 788 ... 809 ~= pointX { // 22
                return 192
            } else if 821.5 ... 844 ~= pointX { // 23
                return 193
            } else if 856.5 ... 878 ~= pointX { // 24
                return 194
            } else if 888 ... 911 ~= pointX { // 25
                return 195
            } else if 921.5 ... 944 ~= pointX { // 26
                return 196
            } else if 956 ... 978 ~= pointX { // 27
                return 197
            } else if 988.5 ... 1010.5 ~= pointX { // 28
                return 198
            } else if 1021 ... 1041 ~= pointX { // 29
                return 199
            } else if 1052.5 ... 1072.5 ~= pointX { // 30
                return 200
            }
        }

        // e
        if 529 ... 547.5 ~= pointY { // Y-cordinate
            if 97.5 ... 117 ~= pointX { // 1
                return 201
            } else if 133 ... 151.5 ~= pointX { // 2
                return 202
            } else if 166 ... 186 ~= pointX { // 3
                return 203
            } else if 198 ... 217.5 ~= pointX { // 4
                return 204
            } else if 230.5 ... 251 ~= pointX { // 5
                return 205
            } else if 262 ... 283.5 ~= pointX { // 6
                return 206
            } else if 295 ... 316 ~= pointX { // 7
                return 207
            } else if 327 ... 347.5 ~= pointX { // 8
                return 208
            } else if 361.5 ... 380.5 ~= pointX { // 9
                return 209
            } else if 392.5 ... 412.5 ~= pointX { // 10
                return 210
            } else if 426.5 ... 445.5 ~= pointX { // 11
                return 211
            } else if 457.5 ... 479 ~= pointX { // 12
                return 212
            } else if 492.5 ... 515 ~= pointX { // 13
                return 213
            } else if 527 ... 548.5 ~= pointX { // 14
                return 214
            } else if 559 ... 580 ~= pointX { // 15
                return 215
            } else if 593 ... 613 ~= pointX { // 16
                return 216
            } else if 625 ... 645 ~= pointX { // 17
                return 217
            } else if 659.5 ... 679.5 ~= pointX { // 18
                return 218
            } else if 691.5 ... 711 ~= pointX { // 19
                return 219
            } else if 723 ... 743 ~= pointX { // 20
                return 220
            } else if 755.5 ... 775 ~= pointX { // 21
                return 221
            } else if 788 ... 809 ~= pointX { // 22
                return 222
            } else if 821.5 ... 844 ~= pointX { // 23
                return 223
            } else if 856.5 ... 878 ~= pointX { // 24
                return 224
            } else if 888 ... 911 ~= pointX { // 25
                return 225
            } else if 921.5 ... 944 ~= pointX { // 26
                return 226
            } else if 956 ... 978 ~= pointX { // 27
                return 227
            } else if 988.5 ... 1010.5 ~= pointX { // 28
                return 228
            } else if 1021 ... 1041 ~= pointX { // 29
                return 229
            } else if 1052.5 ... 1072.5 ~= pointX { // 30
                return 230
            }
        }

        // d
        if 558.5 ... 577 ~= pointY { // Y-cordinate
            if 97.5 ... 117 ~= pointX { // 1
                return 231
            } else if 133 ... 151.5 ~= pointX { // 2
                return 232
            } else if 166 ... 186 ~= pointX { // 3
                return 233
            } else if 198 ... 217.5 ~= pointX { // 4
                return 234
            } else if 230.5 ... 251 ~= pointX { // 5
                return 235
            } else if 262 ... 283.5 ~= pointX { // 6
                return 236
            } else if 295 ... 316 ~= pointX { // 7
                return 237
            } else if 327 ... 347.5 ~= pointX { // 8
                return 238
            } else if 361.5 ... 380.5 ~= pointX { // 9
                return 239
            } else if 392.5 ... 412.5 ~= pointX { // 10
                return 240
            } else if 426.5 ... 445.5 ~= pointX { // 11
                return 241
            } else if 457.5 ... 479 ~= pointX { // 12
                return 242
            } else if 492.5 ... 515 ~= pointX { // 13
                return 243
            } else if 527 ... 548.5 ~= pointX { // 14
                return 244
            } else if 559 ... 580 ~= pointX { // 15
                return 245
            } else if 593 ... 613 ~= pointX { // 16
                return 246
            } else if 625 ... 645 ~= pointX { // 17
                return 247
            } else if 659.5 ... 679.5 ~= pointX { // 18
                return 248
            } else if 691.5 ... 711 ~= pointX { // 19
                return 249
            } else if 723 ... 743 ~= pointX { // 20
                return 250
            } else if 755.5 ... 775 ~= pointX { // 21
                return 251
            } else if 788 ... 809 ~= pointX { // 22
                return 252
            } else if 821.5 ... 844 ~= pointX { // 23
                return 253
            } else if 856.5 ... 878 ~= pointX { // 24
                return 254
            } else if 888 ... 911 ~= pointX { // 25
                return 255
            } else if 921.5 ... 944 ~= pointX { // 26
                return 256
            } else if 956 ... 978 ~= pointX { // 27
                return 257
            } else if 988.5 ... 1010.5 ~= pointX { // 28
                return 258
            } else if 1021 ... 1041 ~= pointX { // 29
                return 259
            } else if 1052.5 ... 1072.5 ~= pointX { // 30
                return 260
            }
        }

        // c
        if 589 ... 608 ~= pointY { // Y-cordinate
            if 97.5 ... 117 ~= pointX { // 1
                return 261
            } else if 133 ... 151.5 ~= pointX { // 2
                return 262
            } else if 166 ... 186 ~= pointX { // 3
                return 263
            } else if 198 ... 217.5 ~= pointX { // 4
                return 264
            } else if 230.5 ... 251 ~= pointX { // 5
                return 265
            } else if 262 ... 283.5 ~= pointX { // 6
                return 266
            } else if 295 ... 316 ~= pointX { // 7
                return 267
            } else if 327 ... 347.5 ~= pointX { // 8
                return 268
            } else if 361.5 ... 380.5 ~= pointX { // 9
                return 269
            } else if 392.5 ... 412.5 ~= pointX { // 10
                return 270
            } else if 426.5 ... 445.5 ~= pointX { // 11
                return 271
            } else if 457.5 ... 479 ~= pointX { // 12
                return 272
            } else if 492.5 ... 515 ~= pointX { // 13
                return 273
            } else if 527 ... 548.5 ~= pointX { // 14
                return 274
            } else if 559 ... 580 ~= pointX { // 15
                return 275
            } else if 593 ... 613 ~= pointX { // 16
                return 276
            } else if 625 ... 645 ~= pointX { // 17
                return 277
            } else if 659.5 ... 679.5 ~= pointX { // 18
                return 278
            } else if 691.5 ... 711 ~= pointX { // 19
                return 279
            } else if 723 ... 743 ~= pointX { // 20
                return 280
            } else if 755.5 ... 775 ~= pointX { // 21
                return 281
            } else if 788 ... 809 ~= pointX { // 22
                return 282
            } else if 821.5 ... 844 ~= pointX { // 23
                return 283
            } else if 856.5 ... 878 ~= pointX { // 24
                return 284
            } else if 888 ... 911 ~= pointX { // 25
                return 285
            } else if 921.5 ... 944 ~= pointX { // 26
                return 286
            } else if 956 ... 978 ~= pointX { // 27
                return 287
            } else if 988.5 ... 1010.5 ~= pointX { // 28
                return 288
            } else if 1021 ... 1041 ~= pointX { // 29
                return 289
            } else if 1052.5 ... 1072.5 ~= pointX { // 30
                return 290
            }
        }

        // b
        if 621.5 ... 640.5 ~= pointY { // Y-cordinate
            if 97.5 ... 117 ~= pointX { // 1
                return 291
            } else if 133 ... 151.5 ~= pointX { // 2
                return 292
            } else if 166 ... 186 ~= pointX { // 3
                return 293
            } else if 198 ... 217.5 ~= pointX { // 4
                return 294
            } else if 230.5 ... 251 ~= pointX { // 5
                return 295
            } else if 262 ... 283.5 ~= pointX { // 6
                return 296
            } else if 295 ... 316 ~= pointX { // 7
                return 297
            } else if 327 ... 347.5 ~= pointX { // 8
                return 298
            } else if 361.5 ... 380.5 ~= pointX { // 9
                return 299
            } else if 392.5 ... 412.5 ~= pointX { // 10
                return 300
            } else if 426.5 ... 445.5 ~= pointX { // 11
                return 301
            } else if 457.5 ... 479 ~= pointX { // 12
                return 302
            } else if 492.5 ... 515 ~= pointX { // 13
                return 303
            } else if 527 ... 548.5 ~= pointX { // 14
                return 304
            } else if 559 ... 580 ~= pointX { // 15
                return 305
            } else if 593 ... 613 ~= pointX { // 16
                return 306
            } else if 625 ... 645 ~= pointX { // 17
                return 307
            } else if 659.5 ... 679.5 ~= pointX { // 18
                return 308
            } else if 691.5 ... 711 ~= pointX { // 19
                return 309
            } else if 723 ... 743 ~= pointX { // 20
                return 310
            } else if 755.5 ... 775 ~= pointX { // 21
                return 311
            } else if 788 ... 809 ~= pointX { // 22
                return 312
            } else if 821.5 ... 844 ~= pointX { // 23
                return 313
            } else if 856.5 ... 878 ~= pointX { // 24
                return 314
            } else if 888 ... 911 ~= pointX { // 25
                return 315
            } else if 921.5 ... 944 ~= pointX { // 26
                return 316
            } else if 956 ... 978 ~= pointX { // 27
                return 317
            } else if 988.5 ... 1010.5 ~= pointX { // 28
                return 318
            } else if 1021 ... 1041 ~= pointX { // 29
                return 319
            } else if 1052.5 ... 1072.5 ~= pointX { // 30
                return 320
            }
        }

        // a
        if 653 ... 670 ~= pointY { // Y-cordinate
            if 97.5 ... 117 ~= pointX { // 1
                return 321
            } else if 133 ... 151.5 ~= pointX { // 2
                return 322
            } else if 166 ... 186 ~= pointX { // 3
                return 323
            } else if 198 ... 217.5 ~= pointX { // 4
                return 324
            } else if 230.5 ... 251 ~= pointX { // 5
                return 325
            } else if 262 ... 283.5 ~= pointX { // 6
                return 326
            } else if 295 ... 316 ~= pointX { // 7
                return 327
            } else if 327 ... 347.5 ~= pointX { // 8
                return 328
            } else if 361.5 ... 380.5 ~= pointX { // 9
                return 329
            } else if 392.5 ... 412.5 ~= pointX { // 10
                return 330
            } else if 426.5 ... 445.5 ~= pointX { // 11
                return 331
            } else if 457.5 ... 479 ~= pointX { // 12
                return 332
            } else if 492.5 ... 515 ~= pointX { // 13
                return 333
            } else if 527 ... 548.5 ~= pointX { // 14
                return 334
            } else if 559 ... 580 ~= pointX { // 15
                return 335
            } else if 593 ... 613 ~= pointX { // 16
                return 336
            } else if 625 ... 645 ~= pointX { // 17
                return 337
            } else if 659.5 ... 679.5 ~= pointX { // 18
                return 338
            } else if 691.5 ... 711 ~= pointX { // 19
                return 339
            } else if 723 ... 743 ~= pointX { // 20
                return 340
            } else if 755.5 ... 775 ~= pointX { // 21
                return 341
            } else if 788 ... 809 ~= pointX { // 22
                return 342
            } else if 821.5 ... 844 ~= pointX { // 23
                return 343
            } else if 856.5 ... 878 ~= pointX { // 24
                return 344
            } else if 888 ... 911 ~= pointX { // 25
                return 345
            } else if 921.5 ... 944 ~= pointX { // 26
                return 346
            } else if 956 ... 978 ~= pointX { // 27
                return 347
            } else if 988.5 ... 1010.5 ~= pointX { // 28
                return 348
            } else if 1021 ... 1041 ~= pointX { // 29
                return 349
            } else if 1052.5 ... 1072.5 ~= pointX { // 30
                return 350
            }
        }
        return 0
    }

    /**
     特定の数値を各ピンの中心に設定する

     - Parameter translatePoint: Arduino，ブレッドボード上の数値
     */
    func coordinateTranslate(translatePoint: Int) {
        if translatePoint == 0 {
            coordinateNumberX = 0
            coordinateNumberY = 0
        }
        // up side -
        if 1 ... 25 ~= translatePoint {
            coordinateNumberY = 220.5
            if translatePoint == 1 {
                coordinateNumberX = 123
            } else if translatePoint == 2 {
                coordinateNumberX = 153.5
            } else if translatePoint == 3 {
                coordinateNumberX = 185.5
            } else if translatePoint == 4 {
                coordinateNumberX = 215.5
            } else if translatePoint == 5 {
                coordinateNumberX = 247.5
            } else if translatePoint == 6 {
                coordinateNumberX = 315.5
            } else if translatePoint == 7 {
                coordinateNumberX = 347
            } else if translatePoint == 8 {
                coordinateNumberX = 378.5
            } else if translatePoint == 9 {
                coordinateNumberX = 410
            } else if translatePoint == 10 {
                coordinateNumberX = 439.5
            } else if translatePoint == 11 {
                coordinateNumberX = 511
            } else if translatePoint == 12 {
                coordinateNumberX = 542.5
            } else if translatePoint == 13 {
                coordinateNumberX = 573.5
            } else if translatePoint == 14 {
                coordinateNumberX = 605
            } else if translatePoint == 15 {
                coordinateNumberX = 634.5
            } else if translatePoint == 16 {
                coordinateNumberX = 711.5
            } else if translatePoint == 17 {
                coordinateNumberX = 742
            } else if translatePoint == 18 {
                coordinateNumberX = 775.5
            } else if translatePoint == 19 {
                coordinateNumberX = 805
            } else if translatePoint == 20 {
                coordinateNumberX = 837
            } else if translatePoint == 21 {
                coordinateNumberX = 911.5
            } else if translatePoint == 22 {
                coordinateNumberX = 944
            } else if translatePoint == 23 {
                coordinateNumberX = 976
            } else if translatePoint == 24 {
                coordinateNumberX = 1005
            } else if translatePoint == 25 {
                coordinateNumberX = 1037
            }
        }

        // up side +
        if 26 ... 50 ~= translatePoint {
            coordinateNumberY = 255.5
            if translatePoint == 26 {
                coordinateNumberX = 123
            } else if translatePoint == 27 {
                coordinateNumberX = 153.5
            } else if translatePoint == 28 {
                coordinateNumberX = 185.5
            } else if translatePoint == 29 {
                coordinateNumberX = 215.5
            } else if translatePoint == 30 {
                coordinateNumberX = 247.5
            } else if translatePoint == 31 {
                coordinateNumberX = 315.5
            } else if translatePoint == 32 {
                coordinateNumberX = 347
            } else if translatePoint == 33 {
                coordinateNumberX = 378.5
            } else if translatePoint == 34 {
                coordinateNumberX = 410
            } else if translatePoint == 35 {
                coordinateNumberX = 439.5
            } else if translatePoint == 36 {
                coordinateNumberX = 511
            } else if translatePoint == 37 {
                coordinateNumberX = 542.5
            } else if translatePoint == 38 {
                coordinateNumberX = 573.5
            } else if translatePoint == 39 {
                coordinateNumberX = 605
            } else if translatePoint == 40 {
                coordinateNumberX = 634.5
            } else if translatePoint == 41 {
                coordinateNumberX = 711.5
            } else if translatePoint == 42 {
                coordinateNumberX = 742
            } else if translatePoint == 43 {
                coordinateNumberX = 775.5
            } else if translatePoint == 44 {
                coordinateNumberX = 805
            } else if translatePoint == 45 {
                coordinateNumberX = 837
            } else if translatePoint == 46 {
                coordinateNumberX = 911.5
            } else if translatePoint == 47 {
                coordinateNumberX = 944
            } else if translatePoint == 48 {
                coordinateNumberX = 976
            } else if translatePoint == 49 {
                coordinateNumberX = 1005
            } else if translatePoint == 50 {
                coordinateNumberX = 1037
            }
        }

        // down side -
        if 351 ... 375 ~= translatePoint {
            coordinateNumberY = 748
            if translatePoint == 351 {
                coordinateNumberX = 123
            } else if translatePoint == 352 {
                coordinateNumberX = 153.5
            } else if translatePoint == 353 {
                coordinateNumberX = 185.5
            } else if translatePoint == 354 {
                coordinateNumberX = 215.5
            } else if translatePoint == 355 {
                coordinateNumberX = 247.5
            } else if translatePoint == 356 {
                coordinateNumberX = 315.5
            } else if translatePoint == 357 {
                coordinateNumberX = 347
            } else if translatePoint == 358 {
                coordinateNumberX = 378.5
            } else if translatePoint == 359 {
                coordinateNumberX = 410
            } else if translatePoint == 360 {
                coordinateNumberX = 439.5
            } else if translatePoint == 361 {
                coordinateNumberX = 511
            } else if translatePoint == 362 {
                coordinateNumberX = 542.5
            } else if translatePoint == 363 {
                coordinateNumberX = 573.5
            } else if translatePoint == 364 {
                coordinateNumberX = 605
            } else if translatePoint == 365 {
                coordinateNumberX = 634.5
            } else if translatePoint == 366 {
                coordinateNumberX = 711.5
            } else if translatePoint == 367 {
                coordinateNumberX = 742
            } else if translatePoint == 368 {
                coordinateNumberX = 775.5
            } else if translatePoint == 369 {
                coordinateNumberX = 805
            } else if translatePoint == 370 {
                coordinateNumberX = 837
            } else if translatePoint == 371 {
                coordinateNumberX = 911.5
            } else if translatePoint == 372 {
                coordinateNumberX = 944
            } else if translatePoint == 373 {
                coordinateNumberX = 976
            } else if translatePoint == 374 {
                coordinateNumberX = 1005
            } else if translatePoint == 375 {
                coordinateNumberX = 1037
            }
        }

        // down side +
        if 376 ... 400 ~= translatePoint {
            coordinateNumberY = 782.5
            if translatePoint == 376 {
                coordinateNumberX = 123
            } else if translatePoint == 377 {
                coordinateNumberX = 153.5
            } else if translatePoint == 378 {
                coordinateNumberX = 185.5
            } else if translatePoint == 379 {
                coordinateNumberX = 215.5
            } else if translatePoint == 380 {
                coordinateNumberX = 247.5
            } else if translatePoint == 381 {
                coordinateNumberX = 315.5
            } else if translatePoint == 382 {
                coordinateNumberX = 347
            } else if translatePoint == 383 {
                coordinateNumberX = 378.5
            } else if translatePoint == 384 {
                coordinateNumberX = 410
            } else if translatePoint == 385 {
                coordinateNumberX = 439.5
            } else if translatePoint == 386 {
                coordinateNumberX = 511
            } else if translatePoint == 387 {
                coordinateNumberX = 542.5
            } else if translatePoint == 388 {
                coordinateNumberX = 573.5
            } else if translatePoint == 389 {
                coordinateNumberX = 605
            } else if translatePoint == 390 {
                coordinateNumberX = 634.5
            } else if translatePoint == 391 {
                coordinateNumberX = 711.5
            } else if translatePoint == 392 {
                coordinateNumberX = 742
            } else if translatePoint == 393 {
                coordinateNumberX = 775.5
            } else if translatePoint == 394 {
                coordinateNumberX = 805
            } else if translatePoint == 395 {
                coordinateNumberX = 837
            } else if translatePoint == 396 {
                coordinateNumberX = 911.5
            } else if translatePoint == 397 {
                coordinateNumberX = 944
            } else if translatePoint == 398 {
                coordinateNumberX = 976
            } else if translatePoint == 399 {
                coordinateNumberX = 1005
            } else if translatePoint == 400 {
                coordinateNumberX = 1037
            }
        }

        // j
        if 51 ... 80 ~= translatePoint {
            coordinateNumberY = 336.5
            if translatePoint == 51 {
                coordinateNumberX = 107.5
            } else if translatePoint == 52 {
                coordinateNumberX = 142.5
            } else if translatePoint == 53 {
                coordinateNumberX = 176
            } else if translatePoint == 54 {
                coordinateNumberX = 208
            } else if translatePoint == 55 {
                coordinateNumberX = 241
            } else if translatePoint == 56 {
                coordinateNumberX = 273
            } else if translatePoint == 57 {
                coordinateNumberX = 305.5
            } else if translatePoint == 58 {
                coordinateNumberX = 337.5
            } else if translatePoint == 59 {
                coordinateNumberX = 371
            } else if translatePoint == 60 {
                coordinateNumberX = 402.5
            } else if translatePoint == 61 {
                coordinateNumberX = 436
            } else if translatePoint == 62 {
                coordinateNumberX = 468.5
            } else if translatePoint == 63 {
                coordinateNumberX = 504
            } else if translatePoint == 64 {
                coordinateNumberX = 538
            } else if translatePoint == 65 {
                coordinateNumberX = 569.5
            } else if translatePoint == 66 {
                coordinateNumberX = 603
            } else if translatePoint == 67 {
                coordinateNumberX = 635
            } else if translatePoint == 68 {
                coordinateNumberX = 669.5
            } else if translatePoint == 69 {
                coordinateNumberX = 701.5
            } else if translatePoint == 70 {
                coordinateNumberX = 733
            } else if translatePoint == 71 {
                coordinateNumberX = 765.5
            } else if translatePoint == 72 {
                coordinateNumberX = 798.5
            } else if translatePoint == 73 {
                coordinateNumberX = 833
            } else if translatePoint == 74 {
                coordinateNumberX = 867.5
            } else if translatePoint == 75 {
                coordinateNumberX = 899.5
            } else if translatePoint == 76 {
                coordinateNumberX = 933
            } else if translatePoint == 77 {
                coordinateNumberX = 967
            } else if translatePoint == 78 {
                coordinateNumberX = 999.5
            } else if translatePoint == 79 {
                coordinateNumberX = 1031
            } else if translatePoint == 80 {
                coordinateNumberX = 1062.5
            }
        }

        // i
        if 81 ... 110 ~= translatePoint {
            coordinateNumberY = 365
            if translatePoint == 81 {
                coordinateNumberX = 107.5
            } else if translatePoint == 82 {
                coordinateNumberX = 142.5
            } else if translatePoint == 83 {
                coordinateNumberX = 176
            } else if translatePoint == 84 {
                coordinateNumberX = 208
            } else if translatePoint == 85 {
                coordinateNumberX = 241
            } else if translatePoint == 86 {
                coordinateNumberX = 273
            } else if translatePoint == 87 {
                coordinateNumberX = 305.5
            } else if translatePoint == 88 {
                coordinateNumberX = 337.5
            } else if translatePoint == 89 {
                coordinateNumberX = 371
            } else if translatePoint == 90 {
                coordinateNumberX = 402.5
            } else if translatePoint == 91 {
                coordinateNumberX = 436
            } else if translatePoint == 92 {
                coordinateNumberX = 468.5
            } else if translatePoint == 93 {
                coordinateNumberX = 504
            } else if translatePoint == 94 {
                coordinateNumberX = 538
            } else if translatePoint == 95 {
                coordinateNumberX = 569.5
            } else if translatePoint == 96 {
                coordinateNumberX = 603
            } else if translatePoint == 97 {
                coordinateNumberX = 635
            } else if translatePoint == 98 {
                coordinateNumberX = 669.5
            } else if translatePoint == 99 {
                coordinateNumberX = 701.5
            } else if translatePoint == 100 {
                coordinateNumberX = 733
            } else if translatePoint == 101 {
                coordinateNumberX = 765.5
            } else if translatePoint == 102 {
                coordinateNumberX = 798.5
            } else if translatePoint == 103 {
                coordinateNumberX = 833
            } else if translatePoint == 104 {
                coordinateNumberX = 867.5
            } else if translatePoint == 105 {
                coordinateNumberX = 899.5
            } else if translatePoint == 106 {
                coordinateNumberX = 933
            } else if translatePoint == 107 {
                coordinateNumberX = 967
            } else if translatePoint == 108 {
                coordinateNumberX = 999.5
            } else if translatePoint == 109 {
                coordinateNumberX = 1031
            } else if translatePoint == 110 {
                coordinateNumberX = 1062.5
            }
        }

        // h
        if 111 ... 140 ~= translatePoint {
            coordinateNumberY = 399.5
            if translatePoint == 111 {
                coordinateNumberX = 107.5
            } else if translatePoint == 112 {
                coordinateNumberX = 142.5
            } else if translatePoint == 113 {
                coordinateNumberX = 176
            } else if translatePoint == 114 {
                coordinateNumberX = 208
            } else if translatePoint == 115 {
                coordinateNumberX = 241
            } else if translatePoint == 116 {
                coordinateNumberX = 273
            } else if translatePoint == 117 {
                coordinateNumberX = 305.5
            } else if translatePoint == 118 {
                coordinateNumberX = 337.5
            } else if translatePoint == 119 {
                coordinateNumberX = 371
            } else if translatePoint == 120 {
                coordinateNumberX = 402.5
            } else if translatePoint == 121 {
                coordinateNumberX = 436
            } else if translatePoint == 122 {
                coordinateNumberX = 468.5
            } else if translatePoint == 123 {
                coordinateNumberX = 504
            } else if translatePoint == 124 {
                coordinateNumberX = 538
            } else if translatePoint == 125 {
                coordinateNumberX = 569.5
            } else if translatePoint == 126 {
                coordinateNumberX = 603
            } else if translatePoint == 127 {
                coordinateNumberX = 635
            } else if translatePoint == 128 {
                coordinateNumberX = 669.5
            } else if translatePoint == 129 {
                coordinateNumberX = 701.5
            } else if translatePoint == 130 {
                coordinateNumberX = 733
            } else if translatePoint == 131 {
                coordinateNumberX = 765.5
            } else if translatePoint == 132 {
                coordinateNumberX = 798.5
            } else if translatePoint == 133 {
                coordinateNumberX = 833
            } else if translatePoint == 134 {
                coordinateNumberX = 867.5
            } else if translatePoint == 135 {
                coordinateNumberX = 899.5
            } else if translatePoint == 136 {
                coordinateNumberX = 933
            } else if translatePoint == 137 {
                coordinateNumberX = 967
            } else if translatePoint == 138 {
                coordinateNumberX = 999.5
            } else if translatePoint == 139 {
                coordinateNumberX = 1031
            } else if translatePoint == 140 {
                coordinateNumberX = 1062.5
            }
        }

        // g
        if 141 ... 170 ~= translatePoint {
            coordinateNumberY = 428.5
            if translatePoint == 141 {
                coordinateNumberX = 107.5
            } else if translatePoint == 142 {
                coordinateNumberX = 142.5
            } else if translatePoint == 143 {
                coordinateNumberX = 176
            } else if translatePoint == 144 {
                coordinateNumberX = 208
            } else if translatePoint == 145 {
                coordinateNumberX = 241
            } else if translatePoint == 146 {
                coordinateNumberX = 273
            } else if translatePoint == 147 {
                coordinateNumberX = 305.5
            } else if translatePoint == 148 {
                coordinateNumberX = 337.5
            } else if translatePoint == 149 {
                coordinateNumberX = 371
            } else if translatePoint == 150 {
                coordinateNumberX = 402.5
            } else if translatePoint == 151 {
                coordinateNumberX = 436
            } else if translatePoint == 152 {
                coordinateNumberX = 468.5
            } else if translatePoint == 153 {
                coordinateNumberX = 504
            } else if translatePoint == 154 {
                coordinateNumberX = 538
            } else if translatePoint == 155 {
                coordinateNumberX = 569.5
            } else if translatePoint == 156 {
                coordinateNumberX = 603
            } else if translatePoint == 157 {
                coordinateNumberX = 635
            } else if translatePoint == 158 {
                coordinateNumberX = 669.5
            } else if translatePoint == 159 {
                coordinateNumberX = 701.5
            } else if translatePoint == 160 {
                coordinateNumberX = 733
            } else if translatePoint == 161 {
                coordinateNumberX = 765.5
            } else if translatePoint == 162 {
                coordinateNumberX = 798.5
            } else if translatePoint == 163 {
                coordinateNumberX = 833
            } else if translatePoint == 164 {
                coordinateNumberX = 867.5
            } else if translatePoint == 165 {
                coordinateNumberX = 899.5
            } else if translatePoint == 166 {
                coordinateNumberX = 933
            } else if translatePoint == 167 {
                coordinateNumberX = 967
            } else if translatePoint == 168 {
                coordinateNumberX = 999.5
            } else if translatePoint == 169 {
                coordinateNumberX = 1031
            } else if translatePoint == 170 {
                coordinateNumberX = 1062.5
            }
        }

        // f
        if 171 ... 200 ~= translatePoint {
            coordinateNumberY = 459.5
            if translatePoint == 171 {
                coordinateNumberX = 107.5
            } else if translatePoint == 172 {
                coordinateNumberX = 142.5
            } else if translatePoint == 173 {
                coordinateNumberX = 176
            } else if translatePoint == 174 {
                coordinateNumberX = 208
            } else if translatePoint == 175 {
                coordinateNumberX = 241
            } else if translatePoint == 176 {
                coordinateNumberX = 273
            } else if translatePoint == 177 {
                coordinateNumberX = 305.5
            } else if translatePoint == 178 {
                coordinateNumberX = 337.5
            } else if translatePoint == 179 {
                coordinateNumberX = 371
            } else if translatePoint == 180 {
                coordinateNumberX = 402.5
            } else if translatePoint == 181 {
                coordinateNumberX = 436
            } else if translatePoint == 182 {
                coordinateNumberX = 468.5
            } else if translatePoint == 183 {
                coordinateNumberX = 504
            } else if translatePoint == 184 {
                coordinateNumberX = 538
            } else if translatePoint == 185 {
                coordinateNumberX = 569.5
            } else if translatePoint == 186 {
                coordinateNumberX = 603
            } else if translatePoint == 187 {
                coordinateNumberX = 635
            } else if translatePoint == 188 {
                coordinateNumberX = 669.5
            } else if translatePoint == 189 {
                coordinateNumberX = 701.5
            } else if translatePoint == 190 {
                coordinateNumberX = 733
            } else if translatePoint == 191 {
                coordinateNumberX = 765.5
            } else if translatePoint == 192 {
                coordinateNumberX = 798.5
            } else if translatePoint == 193 {
                coordinateNumberX = 833
            } else if translatePoint == 194 {
                coordinateNumberX = 867.5
            } else if translatePoint == 195 {
                coordinateNumberX = 899.5
            } else if translatePoint == 196 {
                coordinateNumberX = 933
            } else if translatePoint == 197 {
                coordinateNumberX = 967
            } else if translatePoint == 198 {
                coordinateNumberX = 999.5
            } else if translatePoint == 199 {
                coordinateNumberX = 1031
            } else if translatePoint == 200 {
                coordinateNumberX = 1062.5
            }
        }

        // e
        if 201 ... 230 ~= translatePoint {
            coordinateNumberY = 538.5
            if translatePoint == 201 {
                coordinateNumberX = 107.5
            } else if translatePoint == 202 {
                coordinateNumberX = 142.5
            } else if translatePoint == 203 {
                coordinateNumberX = 176
            } else if translatePoint == 204 {
                coordinateNumberX = 208
            } else if translatePoint == 205 {
                coordinateNumberX = 241
            } else if translatePoint == 206 {
                coordinateNumberX = 273
            } else if translatePoint == 207 {
                coordinateNumberX = 305.5
            } else if translatePoint == 208 {
                coordinateNumberX = 337.5
            } else if translatePoint == 209 {
                coordinateNumberX = 371
            } else if translatePoint == 210 {
                coordinateNumberX = 402.5
            } else if translatePoint == 211 {
                coordinateNumberX = 436
            } else if translatePoint == 212 {
                coordinateNumberX = 468.5
            } else if translatePoint == 213 {
                coordinateNumberX = 504
            } else if translatePoint == 214 {
                coordinateNumberX = 538
            } else if translatePoint == 215 {
                coordinateNumberX = 569.5
            } else if translatePoint == 216 {
                coordinateNumberX = 603
            } else if translatePoint == 217 {
                coordinateNumberX = 635
            } else if translatePoint == 218 {
                coordinateNumberX = 669.5
            } else if translatePoint == 219 {
                coordinateNumberX = 701.5
            } else if translatePoint == 220 {
                coordinateNumberX = 733
            } else if translatePoint == 221 {
                coordinateNumberX = 765.5
            } else if translatePoint == 222 {
                coordinateNumberX = 798.5
            } else if translatePoint == 223 {
                coordinateNumberX = 833
            } else if translatePoint == 224 {
                coordinateNumberX = 867.5
            } else if translatePoint == 225 {
                coordinateNumberX = 899.5
            } else if translatePoint == 226 {
                coordinateNumberX = 933
            } else if translatePoint == 227 {
                coordinateNumberX = 967
            } else if translatePoint == 228 {
                coordinateNumberX = 999.5
            } else if translatePoint == 229 {
                coordinateNumberX = 1031
            } else if translatePoint == 230 {
                coordinateNumberX = 1062.5
            }
        }

        // d
        if 231 ... 260 ~= translatePoint {
            coordinateNumberY = 568
            if translatePoint == 231 {
                coordinateNumberX = 107.5
            } else if translatePoint == 232 {
                coordinateNumberX = 142.5
            } else if translatePoint == 233 {
                coordinateNumberX = 176
            } else if translatePoint == 234 {
                coordinateNumberX = 208
            } else if translatePoint == 235 {
                coordinateNumberX = 241
            } else if translatePoint == 236 {
                coordinateNumberX = 273
            } else if translatePoint == 237 {
                coordinateNumberX = 305.5
            } else if translatePoint == 238 {
                coordinateNumberX = 337.5
            } else if translatePoint == 239 {
                coordinateNumberX = 371
            } else if translatePoint == 240 {
                coordinateNumberX = 402.5
            } else if translatePoint == 241 {
                coordinateNumberX = 436
            } else if translatePoint == 242 {
                coordinateNumberX = 468.5
            } else if translatePoint == 243 {
                coordinateNumberX = 504
            } else if translatePoint == 244 {
                coordinateNumberX = 538
            } else if translatePoint == 245 {
                coordinateNumberX = 569.5
            } else if translatePoint == 246 {
                coordinateNumberX = 603
            } else if translatePoint == 247 {
                coordinateNumberX = 635
            } else if translatePoint == 248 {
                coordinateNumberX = 669.5
            } else if translatePoint == 249 {
                coordinateNumberX = 701.5
            } else if translatePoint == 250 {
                coordinateNumberX = 733
            } else if translatePoint == 251 {
                coordinateNumberX = 765.5
            } else if translatePoint == 252 {
                coordinateNumberX = 798.5
            } else if translatePoint == 253 {
                coordinateNumberX = 833
            } else if translatePoint == 254 {
                coordinateNumberX = 867.5
            } else if translatePoint == 255 {
                coordinateNumberX = 899.5
            } else if translatePoint == 256 {
                coordinateNumberX = 933
            } else if translatePoint == 257 {
                coordinateNumberX = 967
            } else if translatePoint == 258 {
                coordinateNumberX = 999.5
            } else if translatePoint == 259 {
                coordinateNumberX = 1031
            } else if translatePoint == 260 {
                coordinateNumberX = 1062.5
            }
        }

        // c
        if 261 ... 290 ~= translatePoint {
            coordinateNumberY = 598.5
            if translatePoint == 261 {
                coordinateNumberX = 107.5
            } else if translatePoint == 262 {
                coordinateNumberX = 142.5
            } else if translatePoint == 263 {
                coordinateNumberX = 176
            } else if translatePoint == 264 {
                coordinateNumberX = 208
            } else if translatePoint == 265 {
                coordinateNumberX = 241
            } else if translatePoint == 266 {
                coordinateNumberX = 273
            } else if translatePoint == 267 {
                coordinateNumberX = 305.5
            } else if translatePoint == 268 {
                coordinateNumberX = 337.5
            } else if translatePoint == 269 {
                coordinateNumberX = 371
            } else if translatePoint == 270 {
                coordinateNumberX = 402.5
            } else if translatePoint == 271 {
                coordinateNumberX = 436
            } else if translatePoint == 272 {
                coordinateNumberX = 468.5
            } else if translatePoint == 273 {
                coordinateNumberX = 504
            } else if translatePoint == 274 {
                coordinateNumberX = 538
            } else if translatePoint == 275 {
                coordinateNumberX = 569.5
            } else if translatePoint == 276 {
                coordinateNumberX = 603
            } else if translatePoint == 277 {
                coordinateNumberX = 635
            } else if translatePoint == 278 {
                coordinateNumberX = 669.5
            } else if translatePoint == 279 {
                coordinateNumberX = 701.5
            } else if translatePoint == 280 {
                coordinateNumberX = 733
            } else if translatePoint == 281 {
                coordinateNumberX = 765.5
            } else if translatePoint == 282 {
                coordinateNumberX = 798.5
            } else if translatePoint == 283 {
                coordinateNumberX = 833
            } else if translatePoint == 284 {
                coordinateNumberX = 867.5
            } else if translatePoint == 285 {
                coordinateNumberX = 899.5
            } else if translatePoint == 286 {
                coordinateNumberX = 933
            } else if translatePoint == 287 {
                coordinateNumberX = 967
            } else if translatePoint == 288 {
                coordinateNumberX = 999.5
            } else if translatePoint == 289 {
                coordinateNumberX = 1031
            } else if translatePoint == 290 {
                coordinateNumberX = 1062.5
            }
        }

        // b
        if 291 ... 320 ~= translatePoint {
            coordinateNumberY = 631
            if translatePoint == 291 {
                coordinateNumberX = 107.5
            } else if translatePoint == 292 {
                coordinateNumberX = 142.5
            } else if translatePoint == 293 {
                coordinateNumberX = 176
            } else if translatePoint == 294 {
                coordinateNumberX = 208
            } else if translatePoint == 295 {
                coordinateNumberX = 241
            } else if translatePoint == 296 {
                coordinateNumberX = 273
            } else if translatePoint == 297 {
                coordinateNumberX = 305.5
            } else if translatePoint == 298 {
                coordinateNumberX = 337.5
            } else if translatePoint == 299 {
                coordinateNumberX = 371
            } else if translatePoint == 300 {
                coordinateNumberX = 402.5
            } else if translatePoint == 301 {
                coordinateNumberX = 436
            } else if translatePoint == 302 {
                coordinateNumberX = 468.5
            } else if translatePoint == 303 {
                coordinateNumberX = 504
            } else if translatePoint == 304 {
                coordinateNumberX = 538
            } else if translatePoint == 305 {
                coordinateNumberX = 569.5
            } else if translatePoint == 306 {
                coordinateNumberX = 603
            } else if translatePoint == 307 {
                coordinateNumberX = 635
            } else if translatePoint == 308 {
                coordinateNumberX = 669.5
            } else if translatePoint == 309 {
                coordinateNumberX = 701.5
            } else if translatePoint == 310 {
                coordinateNumberX = 733
            } else if translatePoint == 311 {
                coordinateNumberX = 765.5
            } else if translatePoint == 312 {
                coordinateNumberX = 798.5
            } else if translatePoint == 313 {
                coordinateNumberX = 833
            } else if translatePoint == 314 {
                coordinateNumberX = 867.5
            } else if translatePoint == 315 {
                coordinateNumberX = 899.5
            } else if translatePoint == 316 {
                coordinateNumberX = 933
            } else if translatePoint == 317 {
                coordinateNumberX = 967
            } else if translatePoint == 318 {
                coordinateNumberX = 999.5
            } else if translatePoint == 319 {
                coordinateNumberX = 1031
            } else if translatePoint == 320 {
                coordinateNumberX = 1062.5
            }
        }

        // a
        if 321 ... 350 ~= translatePoint {
            coordinateNumberY = 661.5
            if translatePoint == 321 {
                coordinateNumberX = 107.5
            } else if translatePoint == 322 {
                coordinateNumberX = 142.5
            } else if translatePoint == 323 {
                coordinateNumberX = 176
            } else if translatePoint == 324 {
                coordinateNumberX = 208
            } else if translatePoint == 325 {
                coordinateNumberX = 241
            } else if translatePoint == 326 {
                coordinateNumberX = 273
            } else if translatePoint == 327 {
                coordinateNumberX = 305.5
            } else if translatePoint == 328 {
                coordinateNumberX = 337.5
            } else if translatePoint == 329 {
                coordinateNumberX = 371
            } else if translatePoint == 330 {
                coordinateNumberX = 402.5
            } else if translatePoint == 331 {
                coordinateNumberX = 436
            } else if translatePoint == 332 {
                coordinateNumberX = 468.5
            } else if translatePoint == 333 {
                coordinateNumberX = 504
            } else if translatePoint == 334 {
                coordinateNumberX = 538
            } else if translatePoint == 335 {
                coordinateNumberX = 569.5
            } else if translatePoint == 336 {
                coordinateNumberX = 603
            } else if translatePoint == 337 {
                coordinateNumberX = 635
            } else if translatePoint == 338 {
                coordinateNumberX = 669.5
            } else if translatePoint == 339 {
                coordinateNumberX = 701.5
            } else if translatePoint == 340 {
                coordinateNumberX = 733
            } else if translatePoint == 341 {
                coordinateNumberX = 765.5
            } else if translatePoint == 342 {
                coordinateNumberX = 798.5
            } else if translatePoint == 343 {
                coordinateNumberX = 833
            } else if translatePoint == 344 {
                coordinateNumberX = 867.5
            } else if translatePoint == 345 {
                coordinateNumberX = 899.5
            } else if translatePoint == 346 {
                coordinateNumberX = 933
            } else if translatePoint == 347 {
                coordinateNumberX = 967
            } else if translatePoint == 348 {
                coordinateNumberX = 999.5
            } else if translatePoint == 349 {
                coordinateNumberX = 1031
            } else if translatePoint == 350 {
                coordinateNumberX = 1062.5
            }
        }

        // Analog
        if 404 ... 414 ~= translatePoint {
            coordinateNumberY = 984
            if translatePoint == 404 { // 3.3V
                coordinateNumberX = 605.5
            } else if translatePoint == 405 { // 5V
                coordinateNumberX = 644.5
            } else if translatePoint == 406 { // GND
                coordinateNumberX = 685
            } else if translatePoint == 407 { // GND
                coordinateNumberX = 722
            } else if translatePoint == 408 { // Vin
                coordinateNumberX = 763
            } else if translatePoint == 409 { // A0
                coordinateNumberX = 835
            } else if translatePoint == 410 { // A1
                coordinateNumberX = 882
            } else if translatePoint == 411 { // A2
                coordinateNumberX = 921.5
            } else if translatePoint == 412 { // A3
                coordinateNumberX = 961.5
            } else if translatePoint == 413 { // A4
                coordinateNumberX = 999.5
            } else if translatePoint == 414 { // A5
                coordinateNumberX = 1038
            }
        }

        // Digital
        if 418 ... 432 ~= translatePoint {
            coordinateNumberY = 65.5
            if translatePoint == 418 { // GND
                coordinateNumberX = 502.5
            } else if translatePoint == 419 { // 13
                coordinateNumberX = 541.5
            } else if translatePoint == 420 {
                coordinateNumberX = 581
            } else if translatePoint == 421 {
                coordinateNumberX = 622
            } else if translatePoint == 422 {
                coordinateNumberX = 661.5
            } else if translatePoint == 423 {
                coordinateNumberX = 699.5
            } else if translatePoint == 424 {
                coordinateNumberX = 739
            } else if translatePoint == 425 {
                coordinateNumberX = 805.5
            } else if translatePoint == 426 {
                coordinateNumberX = 845
            } else if translatePoint == 427 {
                coordinateNumberX = 882.5
            } else if translatePoint == 428 {
                coordinateNumberX = 922
            } else if translatePoint == 429 {
                coordinateNumberX = 962.5
            } else if translatePoint == 430 {
                coordinateNumberX = 1001.5
            } else if translatePoint == 431 {
                coordinateNumberX = 1040.5
            } else if translatePoint == 432 {
                coordinateNumberX = 1078.5
            }
        }

//        return true
    }
}
