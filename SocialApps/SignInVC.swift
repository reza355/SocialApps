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
    @IBOutlet weak var emailField: FieldStyle!
    @IBOutlet weak var passwordField: FieldStyle!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func facebookLoginOnPressed(_ sender: Any) {
        let facebookLogin = FBSDKLoginManager()
        
        facebookLogin.logIn(withReadPermissions: ["email"], from: self){ (result, error) in
            if error != nil{
                print ("ini: unable to authenticate with facebook - \(error)")
            }else if result?.isCancelled == true{
                print ("ini: user cancelled authenticating")
            }else{
                print ("ini: successfully authenticating")
                let credential = FIRFacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
                self.firebaseAuth(credential)
            }
        }
    }
    
    func firebaseAuth(_ credential: FIRAuthCredential){
        FIRAuth.auth()?.signIn(with: credential, completion: {(user, error) in
            if error != nil{
                print("ini: unable authenticate firebase - \(error)")
            }else{
                print("ini: firebase auth success")
            }
        })
    }
    @IBAction func signInBtnOnPressed(_ sender: Any) {
        if let email = emailField.text, let pass = passwordField.text{
            FIRAuth.auth()?.signIn(withEmail: email, password: pass, completion: {(user, error) in
                if error ==  nil{
                    print("ini: email authenticate with firebase")
                }else{
                    FIRAuth.auth()?.createUser(withEmail: email, password: pass, completion: {(user, error) in
                        if error != nil{
                            print("ini: unable authenticate firebase - \(error)")
                        }else{
                            print("ini: firebase email auth success")
                        }
                    })
                }
            })
        }
    }
}

