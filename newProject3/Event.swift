//
//  Event.swift
//  newProject3
//
//  Created by Sona Jeswani on 11/20/16.
//  Copyright © 2016 Sona Jeswani. All rights reserved.
//

import Foundation

class Event {
    
    var name: String = ""
    var description: String = ""
    var date: String = ""
    var numRSVP: Int = 0
    var poster: String = ""
    var picture: String = ""
    var posterName: String = ""
    
    init(key: String, dict:[String:AnyObject]) {
        
        if let name = dict["name"] as? String {
            self.name = name
        }
        
        if let posterName = dict["posterName"] as? String {
            self.posterName = posterName
        }
        
        if let description = dict["description"] as? String {
            self.description = description
        }
        
        if let date = dict["date"] as? String {
            self.date = date
        }
        
        if let numRSVP = dict["numRSVP"] as? Int {
            self.numRSVP = numRSVP
        }
        
        if let poster = dict["poster"] as? String {
            self.poster = poster
        }
        
        if let picture = dict["picture"] as? String {
            self.picture = picture
        }
        
        
    }
    
    
}