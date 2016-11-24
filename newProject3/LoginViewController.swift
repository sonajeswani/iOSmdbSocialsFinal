//
//  LoginViewController.swift
//  Project3
//
//  Created by Sona Jeswani on 11/12/16.
//  Copyright © 2016 Sona Jeswani. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase
//import FirebaseAnalytics

class LoginViewController: UIViewController {
    
    var emailField: UITextField!
    var passwordField: UITextField!
    var loginButton:UIButton!
    var signUpButton:UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpFields()
        setUpButtons() //login and signup
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setUpFields() {
        
        emailField = UITextField(frame: CGRect(x: 40, y: 120, width: UIScreen.mainScreen().bounds.width - 80, height: 45))
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
        
        passwordField = UITextField(frame: CGRect(x: 40, y: 180, width: UIScreen.mainScreen().bounds.width - 80, height: 45))
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
        //passwordField.delegate = self
  
    }
    
    func setUpButtons() {
    
        let loginButton = UIButton(frame: CGRect(x: 230, y: 260, width: 120, height: 40))
        loginButton.backgroundColor = UIColor.blueColor()
        loginButton.setTitle("Login", forState: .Normal)
        loginButton.layer.cornerRadius = 3
        loginButton.addTarget(self, action: #selector(LoginViewController.loginButtonPressed), forControlEvents: .TouchUpInside)
        self.view.addSubview(loginButton)
        
        
        let signUpButton = UIButton(frame: CGRect(x: 70, y: 260, width: 120, height: 40))
        signUpButton.backgroundColor = UIColor.blueColor()
        signUpButton.setTitle("Signup", forState: .Normal)
        signUpButton.layer.cornerRadius = 3
        signUpButton.addTarget(self, action: #selector(LoginViewController.signUpButtonPressed), forControlEvents: .TouchUpInside)
        self.view.addSubview(signUpButton)
    
    }
    func signUpButtonPressed() {
        self.performSegueWithIdentifier("toSignUp", sender: self)
    }
    
    
    func loginButtonPressed() {
        
        FIRAuth.auth()?.signInWithEmail(emailField.text!, password: passwordField.text!) { (user, error) in
            if error == nil {
                self.performSegueWithIdentifier("fromLoginToFeed", sender: self)
            } else {
                print("There was an error logging in: ")
                print(error)
            }
        }
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
