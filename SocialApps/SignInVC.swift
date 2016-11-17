//
//  ViewController.swift
//  SocialApps
//
//  Created by Fathureza Januarza on 11/14/16.
//  Copyright © 2016 tedihouse. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import Firebase

class SignInVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func facebookLoginOnPressed(_ sender: Any) {
        let facebookLogin = FBSDKLoginManager()
        
        facebookLogin.logIn(withReadPermissions: ["email"], from: self){ (result, error) in
            if error != nil{
                print ("unable to authenticate with facebook - \(error)")
            }else if result?.isCancelled == true{
                print ("user cancelled authenticating")
            }else{
                print ("successfully authenticating")
                let credential = FIRFacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
                self.firebaseAuth(credential)
            }
        }
    }
    
    func firebaseAuth(_ credential: FIRAuthCredential){
        FIRAuth.auth()?.signIn(with: credential, completion: {(user, error) in
            if error != nil{
                print("unable authenticate firebase - \(error)")
            }else{
                print("firebase auth success")
            }
        })
    }
}

