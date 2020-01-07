//
//  EditViewController.swift
//  ADVIS
//
//  Created by Tatsumi Nishida on 1/5/20.
//  Copyright © 2020 Tatsumi. All rights reserved.
//

import UIKit
/// コードを編集する画面を制御する
class EditViewController: UIViewController {
    // MARK: - エディタ -

    @IBOutlet var textView: UITextView!
    let codingNetwork = CodingNetwork() // Heroku上のサーバと通信開始するインスタンス生成

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    // MARK: - 戻るボタン -

    @IBAction func backButton(_: Any) {
        codingNetwork.postCode(requestBody: textView.text) // 通信開始
        performSegue(withIdentifier: "toViewController", sender: nil)
    }

    override func prepare(for segue: UIStoryboardSegue, sender _: Any?) {
        if segue.identifier == "toViewController" {
            let viewController = (segue.destination as? ViewController)!
            viewController.code = textView.text
        }
    }

    /*
     // MARK: - Navigation

     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         // Get the new view controller using segue.destination.
         // Pass the selected object to the new view controller.
     }
     */
}
