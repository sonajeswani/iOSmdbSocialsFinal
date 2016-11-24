//
//  DetailViewController.swift
//  Project3
//
//  Created by Sona Jeswani on 11/12/16.
//  Copyright © 2016 Sona Jeswani. All rights reserved.
//

import UIKit
import Firebase

class DetailViewController: UIViewController {

    var currUserEvent: Event?
    var currEventID: String?
    var detailField: UILabel!
    var rsvpButton:UIButton!
    var numRSVP: UIButton!
    var interestedButton: UIButton!
    var memberName: UILabel!
    var eventName: UILabel!
    let dbRef = FIRDatabase.database().reference
    //var groupId: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        setUpLabels()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setUpLabels() {
        
        
//        numRSVP = UIButton(frame: CGRect(x: 140, y: 600, width: 20, height: 20))
//        numRSVP.backgroundColor = UIColor.blueColor()
//        numRSVP.setTitle("12 interested", forState: .Normal)
//        numRSVP.layer.cornerRadius = 3
//        //rsvpButton.addTarget(self, action: #selector(createPost), forControlEvents: .TouchUpInside)
//        self.view.addSubview(numRSVP)
        
        
        rsvpButton = UIButton(frame: CGRect(x: UIScreen.mainScreen().bounds.width-60, y: 610, width: 20, height: 20))
        rsvpButton.backgroundColor = UIColor.blueColor()
        rsvpButton.setTitle("+", forState: .Normal)
        rsvpButton.layer.cornerRadius = 3
        rsvpButton.addTarget(self, action: #selector(RSVPbuttonPressed), forControlEvents: .TouchUpInside)
        self.view.addSubview(rsvpButton)
        
        interestedButton = UIButton(frame: CGRect(x: UIScreen.mainScreen().bounds.width/2 - 140, y: 600, width: 260, height: 40))
        interestedButton.backgroundColor = UIColor.blueColor()
        interestedButton.setTitle(String(currUserEvent!.numRSVP) + " interested!", forState: .Normal)
        interestedButton.layer.cornerRadius = 3
        //interestedButton.addTarget(self, action: #selector(openModel), forControlEvents: .TouchUpInside)
        self.view.addSubview(interestedButton)
        
        
        eventName = UILabel(frame: CGRect(x: UIScreen.mainScreen().bounds.width/2 - 210, y: 150, width: 350, height: 50))
        eventName.font = UIFont.systemFontOfSize(20)
        eventName.textAlignment = .Right
        eventName.text = currUserEvent!.name
        eventName.textColor = UIColor.lightGrayColor()
        self.view.addSubview(eventName)
        
        detailField = UILabel(frame: CGRect(x: UIScreen.mainScreen().bounds.width/2 - 100, y: 250, width: 150, height: 60))
        detailField.font = UIFont.systemFontOfSize(20)
        detailField.text = currUserEvent!.description
        detailField.textAlignment = .Right
        detailField.textColor = UIColor.lightGrayColor()
        self.view.addSubview(detailField)
    }
    
    func RSVPbuttonPressed() {
        //increment event's num rsvp attribute by 1. MUST SAVE TO DATABASE
        
        currUserEvent?.numRSVP += 1
        interestedButton.setTitle(String(currUserEvent!.numRSVP) + " interested!", forState: .Normal)
        
//        self.dbRef().child("Events/" + currEventID!).setValue(["numRSVP": currUserEvent!.numRSVP], withCompletionBlock: { (error, ref) -> Void in
//            if error == nil {
//                
//            }
//        })
        
    }
    
    func interestedButtonPressed() {
        //must pull up model
        
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
