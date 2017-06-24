//
//  AppDelegate.swift
//  justorderstore
//
//  Created by RayRainier on 4/24/17.
//  Copyright © 2017 RadiuSense. All rights reserved.
//

import UIKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    var products = [Product]()
        
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        FIRApp.configure()

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        
        window?.rootViewController = UINavigationController(rootViewController: MyController())

//        // firebase call
//        self.retrieveProducts(completionHandler: {
//            
//            isSuccessful -> Void in
//            if isSuccessful {
//                
//                print("@AppDelegate Results count = \(results.count)")
//                
//            } else {
//                
//                print("Error: completionHandler")
//                
//            }
//            
//        }) // end of function
        
        return true
    }

    func retrieveProducts(completionHandler: @escaping (Bool) -> Void) {
        
        let storeID = "iLCtXp27p4WL5vaVirCIwW8Eprt2"
        
        FIRDatabase.database().reference().child(storeID).child("products").observe(.childAdded, with: {(snapshot) in
            
            if let snapDictionary = snapshot.value as? [String: AnyObject] {
                
                let product = Product(data: snapDictionary)
                
                self.products.append(product)
                
            }
            
            DispatchQueue.main.async(execute: {
                
               results = self.products
                
                if results.count == 0 {
                    completionHandler(false)
                } else {
                    completionHandler(true)
                }
                
            })
            
        }, withCancel: nil)
        
    }	// end-of-function

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

