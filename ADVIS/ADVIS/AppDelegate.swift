//
//  AppDelegate.swift
//  ADVIS
//
//  Created by Tatsumi Nishida on 2018/06/04.
//  Copyright © 2018年 Tatsumi Nishida. All rights reserved.
//

import SwiftyBeaver
import UIKit

/// SwiftyBeaver.Type
let logger = SwiftyBeaver.self

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_: UIApplication, didFinishLaunchingWithOptions _: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.

        // Settings SwiftyBeaver
        let console = ConsoleDestination()
        /// 環境変数を使う
        let env = ProcessInfo.processInfo.environment
        console.format = "$DHH:mm:ss.SSS$d $C$L$c $N.$F:No.$l $M"
        let platform = SBPlatformDestination(
            appID: env["appID"] ?? "APP_KEY",
            appSecret: env["appSecret"] ?? "APP_SECRET",
            encryptionKey: env["EncryptionKey"] ?? "EncryptionKey"
        )
        logger.addDestination(console)
        logger.addDestination(platform)

        // windowを生成
        window = UIWindow(frame: UIScreen.main.bounds)
        // Storyboardを指定
        let storyboard = UIStoryboard(name: "Splash", bundle: nil)

        let initialViewController = storyboard.instantiateViewController(withIdentifier: "Splash")
        // rootViewControllerに入れる
        window?.rootViewController = initialViewController
        // 表示
        window?.makeKeyAndVisible()

        return true
    }

    /// アプリが閉じそうなときに呼ばれる
    func applicationWillResignActive(_: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    /// アプリを閉じたときに呼ばれる
    func applicationDidEnterBackground(_: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    /// アプリを開きそうなときに呼ばれる
    func applicationWillEnterForeground(_: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    /// アプリを開いたときに呼ばれる
    func applicationDidBecomeActive(_: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    /// タスクキルでアプリを終了したときに呼ばれる
    func applicationWillTerminate(_: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
}
