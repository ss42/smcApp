//
//  firebase.swift
//  SMC
//
//  Created by Sanjay Shrestha on 4/3/16.
//  Copyright © 2016 www.ssanjay.com. All rights reserved.
//

import Foundation
import Firebase

let firebase = "https://smc-essentials.firebaseapp.com"



class DataService {
    static let dataService = DataService()
    
    private var _BASE_REF = Firebase(url: "\(firebase)")
    private var _USER_REF = Firebase(url: "\(firebase)/users")
    private var _FORUM_REF = Firebase(url: "\(firebase)/jokes")
    
    var BASE_REF: Firebase {
        return _BASE_REF
    }
    
    var USER_REF: Firebase {
        return _USER_REF
    }
    
    var FORUM_REF: Firebase {
        return _FORUM_REF
    }
   
    
    func createNewForum(forum: Dictionary<String, AnyObject>) {
        
        // Save the Forum
        // FORUM_REF is the parent of the new Forum: "forums".
        // childByAutoId() saves the joke and gives it its own ID.
        
        let firebaseNewForum = FORUM_REF.childByAutoId()
        
        // setValue() saves to Firebase.
        
        firebaseNewForum.setValue(forum)
    }
}
