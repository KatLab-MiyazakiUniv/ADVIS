//
//  SplashViewController.swift
//  ADVIS
//
//  Created by Tatsumi Nishida on 2018/08/20.
//  Copyright © 2018年 Tatsumi Nishida. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {
    @IBOutlet var splashImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        // Small 80%
        UIView.animate(withDuration: 0.3,
                       delay: 1.0,
                       options: UIView.AnimationOptions.curveEaseOut,
                       animations: { () in
                           self.splashImageView.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
                       }, completion: { _ in

        })

        // × 8
        UIView.animate(withDuration: 0.2,
                       delay: 1.3,
                       options: UIView.AnimationOptions.curveEaseOut,
                       animations: { () in
                           self.splashImageView.transform = CGAffineTransform(scaleX: 8.0, y: 8.0)
                           self.splashImageView.alpha = 0
                       }, completion: { _ in
                           // Delete imageview
                           self.splashImageView.removeFromSuperview()
                           // sleep(1)
                           let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                           let nextView = storyboard.instantiateViewController(withIdentifier: "Main") as! ViewController
                           self.present(nextView, animated: false, completion: nil)
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
     // MARK: - Navigation

     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
}
