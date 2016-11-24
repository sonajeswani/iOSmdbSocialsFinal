//
//  SignUpViewController.swift
//  Project3
//
//  Created by Sona Jeswani on 11/12/16.
//  Copyright © 2016 Sona Jeswani. All rights reserved.
//

import UIKit
import Firebase
//import FirebaseAnalytics

class SignUpViewController: UIViewController {
    
    var emailField: UITextField!
    var passwordField: UITextField!
    var nameField: UITextField!
    var signUpButton:UIButton!
    let dbRef = FIRDatabase.database().reference
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpTextFields()
        setUpButton()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setUpTextFields() {
        
        nameField = UITextField(frame: CGRect(x: 40, y: 120, width: UIScreen.mainScreen().bounds.width - 80, height: 45))
        nameField.placeholder = "Name"
        nameField.alpha = 0.4
        nameField.font = UIFont.systemFontOfSize(15)
        nameField.layer.cornerRadius = 3
        nameField.keyboardType = .Default
        nameField.returnKeyType = .Done
        //emailField.delegate = self
        nameField.clearButtonMode = .WhileEditing
        nameField.contentVerticalAlignment = .Center
        nameField.backgroundColor = UIColor.yellowColor()
        self.view.addSubview(nameField)
        
        
        
        emailField = UITextField(frame: CGRect(x: 40, y: 180, width: UIScreen.mainScreen().bounds.width - 80, height: 45))
        emailField.placeholder = "Email"
        emailField.alpha = 0.4
        emailField.font = UIFont.systemFontOfSize(15)
        emailField.layer.cornerRadius = 3
        emailField.keyboardType = .Default
        emailField.returnKeyType = .Done
        //emailField.delegate = self
        emailField.clearButtonMode = .WhileEditing
        emailField.contentVerticalAlignment = .Center
        emailField.backgroundColor = UIColor.yellowColor()
        self.view.addSubview(emailField)
        
        passwordField = UITextField(frame: CGRect(x: 40, y: 240, width: UIScreen.mainScreen().bounds.width - 80, height: 45))
        passwordField.placeholder = "Password"
        passwordField.alpha = 0.4
        passwordField.font = UIFont.systemFontOfSize(15)
        passwordField.borderStyle = .None
        passwordField.layer.cornerRadius = 3
        passwordField.autocorrectionType = .No
        
        passwordField.keyboardType = .Default
        passwordField.returnKeyType = .Done
        passwordField.clearButtonMode = .WhileEditing
        passwordField.secureTextEntry = true
        passwordField.contentVerticalAlignment = .Center
        passwordField.backgroundColor = UIColor.yellowColor()
        self.view.addSubview(passwordField)
        
    }
    
    
    func signupUser() -> Void {
        print("works")
        let email = emailField.text!
        let password = passwordField.text!
        let name = nameField.text!
        FIRAuth.auth()!.createUserWithEmail(email, password: password, completion: { user, error in
            if error == nil {
                let changeRequest = user!.profileChangeRequest()
                changeRequest.displayName = name
            
                changeRequest.commitChangesWithCompletion({ (error) in
                    if error != nil {
                        print("yay")
                    }
                    else {
                        print("aw")
                    }
                })
                
                self.dbRef().child("Users/\(user!.uid)/email").setValue(email)
                self.dbRef().child("Users/\(user!.uid)/name").setValue(name)
                self.performSegueWithIdentifier("fromSignUpToFeed", sender: self)
                

            }
        })
    }
    
    func setUpButton() {
    
    signUpButton = UIButton(frame: CGRect(x: 140, y: 300, width: 120, height: 40))
    signUpButton.backgroundColor = UIColor.blueColor()
    signUpButton.setTitle("Sign Up!", forState: .Normal)
    signUpButton.layer.cornerRadius = 3
    signUpButton.addTarget(self, action: #selector(signupUser), forControlEvents: .TouchUpInside)
    self.view.addSubview(signUpButton)
        
    }
    
    
    


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
