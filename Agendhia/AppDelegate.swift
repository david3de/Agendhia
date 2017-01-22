//
//  AppDelegate.swift
//  Agendhia
//
//  Created by Trevor Jordy on 1/21/17.
//  Copyright © 2017 Trevor Jordy. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, GIDSignInDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        // Use Firebase library to configure APIs
        FIRApp.configure()
        
        GIDSignIn.sharedInstance().clientID = FIRApp.defaultApp()?.options.clientID
        GIDSignIn.sharedInstance().delegate = self
        
        // Reads data from Firebase and stores locally on startup
        let user = String (describing: FIRAuth.auth()?.currentUser?.uid)
        
        // Tasks
        ref = FIRDatabase.database().reference().child("users").child(user).child( "tasks")
        
        ref?.observe(.value, with: { snapshot in
            
            if !snapshot.exists() {
                return
            } else {
                for item in snapshot.children {
                    let tmp = Task(snapshot: item as! FIRDataSnapshot)
                    list.append(tmp)
                }
            }
            
        })
        
        
        
        
        ref = FIRDatabase.database().reference().child("users").child(user).child("pet").child("healthAmount")
       
        ref?.observe(.value, with: { snapshot in
            
            if !snapshot.exists() {
                return
            } else {
                healthAmount = snapshot.value as! Double
            }
            
        })
        
        
        ref = FIRDatabase.database().reference().child("users").child(user).child("pet").child("staminaAmount")
        
        ref?.observe(.value, with: { snapshot in
            if !snapshot.exists() {
                return
            } else {
                staminaAmount = snapshot.value as! Double
            }
        })
        
        ref = FIRDatabase.database().reference().child("users").child(user).child("pet").child("foodAmount")
        ref?.observe(.value, with: { snapshot in
            if !snapshot.exists() {
                return
            } else {
                foodAmount = snapshot.value as! Double
            }
                
        })

        ref = FIRDatabase.database().reference().child("users").child(user).child("goldAmount")
        ref?.observe(.value, with: { snapshot in
            goldAmount = snapshot.value as! Int
        })
        
        
        
        return true
    }
    
    
    // Application compatibility helper functions----------------------------------------------------
    @available(iOS 9.0, *)
    func application(_ application: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any])
        -> Bool {
            return GIDSignIn.sharedInstance().handle(url,
                                                        sourceApplication:options[UIApplicationOpenURLOptionsKey.sourceApplication] as? String,
                                                        annotation: [:])
    }
    
    func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
        return GIDSignIn.sharedInstance().handle(url,
                                                    sourceApplication: sourceApplication,
                                                    annotation: annotation)
    }
    
    
    // Google Auth Sign in/out protocols-------------------------------------------------------------
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error?) {
        // ...
        if let error = error {
            print("Error logging in")
            return
        }
        
        guard let authentication = user.authentication else { return }
        let credential = FIRGoogleAuthProvider.credential(withIDToken: authentication.idToken,
                                                          accessToken: authentication.accessToken)
        print("Login success")
        
        FIRAuth.auth()?.signIn(with: credential) { (user, error) in
            // ...
            if let error = error {
                // ...
                return
            }
        }
    }
    
    func signIn(signIn: GIDSignIn!, didDisconnectWithUser user:GIDGoogleUser!,
                withError error: NSError!) {
        // Perform any operations when the user disconnects from app here.
        // ...
    }


    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
        // Deletes and reinstates tasks on Firebase
        ref = FIRDatabase.database().reference()
        let user = String (describing: FIRAuth.auth()?.currentUser?.uid)
        ref?.child("users").child(user).child("tasks").removeValue(completionBlock: { (error, refer) in
            if error != nil {
                print(error)
            } else {
                print(refer)
            }
        })
        for item in list {
            ref?.child("users").child(user).child("tasks").child(item.name).setValue(["name": item.name,
                                                                                      "startTime": item.startTime,
                                                                                      "endTime": item.endTime,
                                                                                      "notes": item.notes])
        }
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

