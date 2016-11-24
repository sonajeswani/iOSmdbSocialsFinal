//
//  NewSocialViewController.swift
//  Project3
//
//  Created by Sona Jeswani on 11/12/16.
//  Copyright © 2016 Sona Jeswani. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class NewSocialViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var eventField: UITextField!
    var descriptionField: UITextField!
    var loginButton:UIButton!
    var dismissButton:UIButton!
    let dbRef = FIRDatabase.database().reference
    var postButton:UIButton!
    var imageButton:UIButton!
    var imageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        // Do any additional setup after loading the view.
        
        setUpFields()
        setUpButtons()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setUpFields() {
        
        eventField = UITextField(frame: CGRect(x: 40, y: 120, width: UIScreen.mainScreen().bounds.width - 80, height: 45))
        eventField.placeholder = "Event Name"
        eventField.alpha = 0.4
        eventField.font = UIFont.systemFontOfSize(15)
        eventField.layer.cornerRadius = 3
        eventField.keyboardType = .Default
        eventField.returnKeyType = .Done
        //emailField.delegate = self
        eventField.clearButtonMode = .WhileEditing
        eventField.contentVerticalAlignment = .Center
        eventField.backgroundColor = UIColor.yellowColor()
        self.view.addSubview(eventField)
        
        
        descriptionField = UITextField(frame: CGRect(x: 40, y: 180, width: UIScreen.mainScreen().bounds.width - 80, height: 45))
        descriptionField.placeholder = "Description"
        descriptionField.alpha = 0.4
        descriptionField.font = UIFont.systemFontOfSize(15)
        descriptionField.borderStyle = .None
        descriptionField.layer.cornerRadius = 3
        descriptionField.autocorrectionType = .No
        
        descriptionField.keyboardType = .Default
        descriptionField.returnKeyType = .Done
        descriptionField.clearButtonMode = .WhileEditing
        descriptionField.contentVerticalAlignment = .Center
        descriptionField.backgroundColor = UIColor.yellowColor()
        self.view.addSubview(descriptionField)
        //passwordField.delegate = self
        
    }
    
    func setUpButtons() {
        
        postButton = UIButton(frame: CGRect(x: 140, y: 600, width: 120, height: 40))
        postButton.backgroundColor = UIColor.blueColor()
        postButton.setTitle("Post!", forState: .Normal)
        postButton.layer.cornerRadius = 3
        postButton.addTarget(self, action: #selector(createPost), forControlEvents: .TouchUpInside)
        self.view.addSubview(postButton)
        
        imageButton = UIButton(frame: CGRect(x: 140, y: 450, width: 120, height: 40))
        imageButton.backgroundColor = UIColor.blueColor()
        imageButton.setTitle("Add Image", forState: .Normal)
        imageButton.layer.cornerRadius = 3
        imageButton.addTarget(self, action: #selector(imageButtonPressed), forControlEvents: .TouchUpInside)
        self.view.addSubview(imageButton)
        
        imageView = UIImageView(frame:CGRect(x: 140, y:300, width: 100, height: 100))
        self.view.addSubview(imageView)
        
        dismissButton = UIButton(frame: CGRect(x: 30, y: 30, width: 40, height: 40))
        dismissButton.backgroundColor = UIColor.blackColor()
        dismissButton.setTitle("X", forState: .Normal)
        dismissButton.addTarget(self, action: #selector(dismissButtonPressed), forControlEvents: .TouchUpInside)
        self.view.addSubview(dismissButton)
        
    }
    
    func createPost() {
        
        let date = NSDate()
        let dateFormat = NSDateFormatter()
        dateFormat.dateFormat = "MM-dd-YYYY"
        let dateString = dateFormat.stringFromDate(date)
        let eventValues: [String:AnyObject] = ["date": dateString,
                           "description": descriptionField.text!,
                           "name": eventField.text!,
                           "picture": "PICCCC" ,
                           "poster": getCurrUserId(),
                           "numRSVP": 0,
                           "posterName": getCurrUserName()]
        
        self.dbRef().child("Events").childByAutoId().setValue(eventValues, withCompletionBlock: { (error, ref) -> Void in
            if error == nil {
                self.dismissViewControllerAnimated(true, completion: nil)
            }
        })
        
    }
    
    
    func getCurrUserId() -> String {
        
        if let user = FIRAuth.auth()?.currentUser {
            return user.uid
        } else {
            return "no user"
        }
    }
    
    func getCurrUserName() -> String {
        
        if let user = FIRAuth.auth()?.currentUser {
            return user.displayName!
            
        } else {
            return "no user"
        }
    }
    
    func imageButtonPressed() {
        let picker = UIImagePickerController()
        picker.delegate = self
        presentViewController(picker, animated: true, completion: nil)
    
    }

    func dismissButtonPressed() {
        
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    //PICKER DELEGATE METHODS
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            imageView.contentMode = .ScaleAspectFit
            imageView.image = pickedImage
            
        }
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissViewControllerAnimated(true, completion: nil)
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
