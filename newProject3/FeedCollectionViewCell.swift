//
//  FeedCollectionViewCell.swift
//  Project3
//
//  Created by Sona Jeswani on 11/12/16.
//  Copyright © 2016 Sona Jeswani. All rights reserved.
//

import UIKit

class FeedCollectionViewCell: UICollectionViewCell {
    
    var eventPic: UIImageView = UIImageView()
    var memberName: UILabel = UILabel()
    var eventName: UILabel = UILabel()
    var numRSVP: UILabel = UILabel()
    var dateLabel: UILabel = UILabel()
    var numRSVPInt: Int = 0
    var postBodyText: UILabel = UILabel()
    //var rsvpButton: UIButton!
    
    override func awakeFromNib() {
        
        eventPic = UIImageView(frame: CGRect(x: 10, y: 10, width: 40, height: 40))
        eventPic.contentMode = .ScaleAspectFill
        eventPic.layer.cornerRadius = eventPic.frame.width/2
        eventPic.clipsToBounds = true
        //self.contentView.addSubview(profPic)
        
        memberName = UILabel(frame: CGRect(x: 60, y: 10, width: UIScreen.mainScreen().bounds.width - 40 - 60, height: 20))
        memberName.font = UIFont.boldSystemFontOfSize(14)
        self.contentView.addSubview(memberName)
        
        eventName = UILabel(frame: CGRect(x: 60, y: 28, width: UIScreen.mainScreen().bounds.width - 40 - 60, height: 20))
        eventName.font = UIFont.boldSystemFontOfSize(14)
        self.contentView.addSubview(eventName)
        
        postBodyText = UILabel(frame: CGRect(x: 60, y: 55, width: UIScreen.mainScreen().bounds.width - 20, height: 20))
        postBodyText.font = UIFont.systemFontOfSize(14)
        self.contentView.addSubview(postBodyText)
        
        
        numRSVP = UILabel(frame: CGRect(x: UIScreen.mainScreen().bounds.width - 95, y: 10, width: 80, height: 30))
        numRSVP.font = UIFont.systemFontOfSize(14)
        numRSVP.textAlignment = .Right
        numRSVP.textColor = UIColor.lightGrayColor()
        self.contentView.addSubview(numRSVP)
        
        dateLabel = UILabel(frame: CGRect(x: UIScreen.mainScreen().bounds.width - 95, y: 40, width: 60, height: 30))
        dateLabel.font = UIFont.systemFontOfSize(16)
        dateLabel.textAlignment = .Right
        dateLabel.textColor = UIColor.lightGrayColor()
        self.contentView.addSubview(numRSVP)
        
        
        self.backgroundColor = UIColor.yellowColor()
        
        
    }
    
    
}
