//
//  StartScreenViewController.swift
//  Agendhia
//
//  Created by Trevor Jordy on 1/22/17.
//  Copyright © 2017 Trevor Jordy. All rights reserved.
//

import Firebase
import GoogleSignIn

class StartScreenViewController: UIViewController, GIDSignInUIDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().signIn()
    }
}
