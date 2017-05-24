//
//  ViewController.swift
//  SocialAppIlkay
//
//  Created by TAE experts on 23/05/2017.
//  Copyright © 2017 IlkayHamit. All rights reserved.
//

import UIKit
import Firebase
import FBSDKCoreKit
import FBSDKLoginKit

class SignInVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func facebookButtonTapped(_ sender: Any) {
        
        //Don't forget to import FBSDKCoreKit and FBSDKLoginKit
        //Authenticate with provider then authenticate with firebase
        
        //Authenticate with facebook and say that we allow the app to have certain elements of myfacebook account
        //Then we tell Firebase we have all of this
        
        //First step check with facebook
        
        let facebookLogin = FBSDKLoginManager()
        
        //Requesting read permissions to the email address
        facebookLogin.logIn(withReadPermissions: ["email"], from: self) { (result, error) in

            if error != nil {
                print("ILKAY: THIS DIDNT WORK FACEBOOK - \(error)")
            } else if result?.isCancelled == true {
                //This happens if user cancels
                print("ILKAY: USER CANCELLED")
            } else {
                print("ILKAY: WE ARE IN FACEBOOK BOIS!")
                //Grabbing the facebook acess token to create a credential
                let credential = FIRFacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
                
                //Check with firebase with the credential we created
                self.firebaseAuthentication(credential)
            }
            
        }
        
        
    }
    
    func firebaseAuthentication(_ credential: FIRAuthCredential) {
        
        FIRAuth.auth()?.signIn(with: credential, completion: { (user, error) in
            if error != nil {
                print("ILKAY: THIS DIDNT WORK FIREBASE - \(error)")
            } else {
                print("ILKAY: WE ARE IN FIREBASE")
            }
        })
        
    }

}

