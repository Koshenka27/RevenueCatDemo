//
//  RevenueCatDemoApp.swift
//  RevenueCatDemo
//
//  Created by Logan Koshenka on 3/14/23.
//

import SwiftUI
import RevenueCat

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        return true
    }
}

@main
struct RevenueCatDemoApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    init() {
        Purchases.configure(withAPIKey: "")
        Purchases.logLevel = .verbose
    }
    
    var body: some Scene {
        WindowGroup {
            TabBar()
        }
    }
}

extension AppDelegate: PurchasesDelegate {
    func purchases(_ purchases: Purchases, receivedUpdated customerInfo: CustomerInfo) {
        // handle changes to customerInfo
    }
}
