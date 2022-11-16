//
//  AppDelegate.swift
//  bytetrackDemo_Swift
//
//  Created by 孙良 on 2022/9/2.
//

import UIKit
import CoreData

/**
 此处要替换为你在bytetrack后台申请的真实apiKey和appId
 */

let apiKey:String = "YOUR API KEY"
let appId:String = "YOUR APP ID"



@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    //在AppDelegate 中添加window 属性


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        Bytetrack.initMessenger(withApiKey: apiKey, forAppId: appId, withPrivateServerURL: nil)//初始化SDK
        Bytetrack.setLanguage(1)//设置语言
        Bytetrack.setLauncherVisible(true)//显示悬浮图标，默认不显示
        return true
    }

    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "bytetrackDemo_Swift")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

}

