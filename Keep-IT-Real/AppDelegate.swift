//
//  AppDelegate.swift
//  Keep-IT-Real
//
//  Created by Jesse Hough on 10/09/23.
//

import UIKit
import ParseSwift

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        UINavigationBar.appearance().tintColor = UIColor.black

        ParseSwift.initialize(applicationId: "Y9bf3a9DHnRmgvEP2zfF0a5lLC0y0pwTNfWtJd0a",
                              clientKey: "ZZvNbRG80TY5hYsIJqiVKupqVcOAk12MOnZB5YIL",
                              serverURL: URL(string: "https://parseapi.back4app.com")!)

        return true
    }


    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {

        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {

    }
}
