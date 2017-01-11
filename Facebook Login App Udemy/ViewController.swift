//
//  ViewController.swift
//  Facebook Login App Udemy
//
//  Created by Cynthia Whitlatch on 12/26/15.
//  Copyright © 2015 Cynthia Whitlatch. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit

class ViewController: UIViewController, FBSDKLoginButtonDelegate {
    
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var profilePictureView: FBSDKProfilePictureView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let loginButton: FBSDKLoginButton = FBSDKLoginButton()
        loginButton.center = CGPoint(x: self.view.frame.midX, y: self.view.frame.height-loginButton.frame.height)
        self.view.addSubview(loginButton)
        
        if FBSDKAccessToken.current() != nil {
            statusLabel.text = "You are logged in as"
            
            displayName()
            
        } else {
            statusLabel.text = "You are logged out!"
            nameLabel.text = ""
        }
    }
    
    func displayName() {
        
        let graphRequest: FBSDKGraphRequest = FBSDKGraphRequest(graphPath: "Me", parameters: nil)
        
        graphRequest.start { (FBSDKGraphRequestConnection, result, error) -> Void in
            
            let name = result.value(forKey: "name") as! String
            self.nameLabel.text = name
        }
    }

    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: NSError!) {
        print("User is Logged In")
    }
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        print("User Logged Out")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

