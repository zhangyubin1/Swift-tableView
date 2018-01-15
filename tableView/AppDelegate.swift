//
//  AppDelegate.swift
//  tableView
//
//  Created by 段桥 on 2018/1/2.
//  Copyright © 2018年 xinhuazhiyun. All rights reserved.
//

import UIKit


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow.init(frame: CGRect.init(x: 0, y: 0, width: kScreeWidth, height: kScreenHeight))
        let navi:UINavigationController
        navi  = UINavigationController.init(rootViewController: ViewController())
        if UserDefaults.standard.bool(forKey: LOGINSTATUS) {//是否处于登录状态
            window?.rootViewController = navi
        }else{
            window?.rootViewController = navi

//            window?.rootViewController = LoginController()
        }
        window?.makeKeyAndVisible()
        
        return true
    }
    
    
    
    

    func applicationWillResignActive(_ application: UIApplication) {
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
 
    }

    func applicationDidBecomeActive(_ application: UIApplication) {

    }

    func applicationWillTerminate(_ application: UIApplication) {
    }


}

