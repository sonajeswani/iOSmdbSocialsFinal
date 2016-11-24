//
//  FeedCollectionViewController.swift
//  Project3
//
//  Created by Sona Jeswani on 11/12/16.
//  Copyright © 2016 Sona Jeswani. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import FirebaseCore
import FirebaseAuth

private let reuseIdentifier = "Cell"

class FeedCollectionViewController: UICollectionViewController {
    
    var selectedEvent : Event?
    var selectedEventID: String?
    var eventObjects = Array<Event>()
    var eventIdList = Array<String>()
    //var eventObjects = [[String: AnyObject]]()
    let postRef = FIRDatabase.database().reference()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Register cell classes
        setupCollectionView()
        
        getEvents()
        self.collectionView?.reloadData()
        
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupCollectionView() {
        collectionView?.registerClass(FeedCollectionViewCell.self, forCellWithReuseIdentifier: "FeedCell")
        collectionView?.backgroundColor = UIColor(red: 0.973, green: 0.973, blue: 0.973, alpha: 1)
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using [segue destinationViewController].
     // Pass the selected object to the new view controller.
     }
     */
    
    // MARK: UICollectionViewDataSource
    
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return eventObjects.count
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("FeedCell", forIndexPath: indexPath) as! FeedCollectionViewCell
        for subview in cell.contentView.subviews {
            subview.removeFromSuperview()
        }
        
        cell.backgroundColor = UIColor.yellowColor()
        cell.awakeFromNib()
        
        cell.layer.shadowOffset = CGSizeMake(0, 1)
        cell.layer.shadowColor = UIColor.blueColor().CGColor
        cell.layer.shadowRadius = 1.5
        cell.layer.cornerRadius = 3
        
        cell.layer.shadowOpacity = 0.35
        
        let shadowFrame: CGRect = (cell.layer.bounds)
        let shadowPath: CGPathRef = UIBezierPath(rect: shadowFrame).CGPath
        cell.layer.shadowPath = shadowPath
        
        let event = eventObjects[indexPath.row]
        
        cell.memberName.text = event.posterName
        cell.eventName.text = event.name
        cell.numRSVP.text = String(event.numRSVP) + " RSVP'ed"
        cell.postBodyText.text = event.description
        cell.dateLabel.text = event.date
        //cell.eventPic.image = UIImage()
        cell.awakeFromNib()
        
        return cell
    }
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        selectedEvent = eventObjects[indexPath.row]
        selectedEventID = eventIdList[indexPath.row]
        self.performSegueWithIdentifier("toDetailScreen", sender: self)
        
    }
    
    
    func getEvents() {
        
        let refHandle = postRef.child("Events")
    
        refHandle.observeEventType(.Value, withBlock: { snapshot -> Void in
            if snapshot.exists() {
                if let eventsDict = snapshot.value as? [String: AnyObject] {
                    for eventDictKey in eventsDict.keys {
                        let dict = eventsDict[eventDictKey] as? [String:AnyObject]
                        let event = Event(key: eventDictKey, dict: dict!)
                        self.eventObjects.append(event)
                        self.eventIdList.append(eventDictKey)
                    }
                    self.collectionView?.reloadData()
                }
                
            }
            
        })
        
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "toDetailScreen" {
            let destVC = segue.destinationViewController as! DetailViewController
            if let selectedEvent = self.selectedEvent {
                destVC.currUserEvent = selectedEvent
                destVC.currEventID = selectedEventID
                
            }
            
        }
    }
    
    // MARK: UICollectionViewDelegate
    
    /*
     // Uncomment this method to specify if the specified item should be highlighted during tracking
     override func collectionView(collectionView: UICollectionView, shouldHighlightItemAtIndexPath indexPath: NSIndexPath) -> Bool {
     return true
     }
     */
    
    /*
     // Uncomment this method to specify if the specified item should be selected
     override func collectionView(collectionView: UICollectionView, shouldSelectItemAtIndexPath indexPath: NSIndexPath) -> Bool {
     return true
     }
     */
    
    /*
     // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
     override func collectionView(collectionView: UICollectionView, shouldShowMenuForItemAtIndexPath indexPath: NSIndexPath) -> Bool {
     return false
     }
     
     override func collectionView(collectionView: UICollectionView, canPerformAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) -> Bool {
     return false
     }
     
     override func collectionView(collectionView: UICollectionView, performAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) {
     
     }
     */
    
}
