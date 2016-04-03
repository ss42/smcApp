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
    private var _POST_REF = Firebase(url: "\(firebase)/posts")
    
    var BASE_REF: Firebase {
        return _BASE_REF
    }
    
    var USER_REF: Firebase {
        return _USER_REF
    }
    
    var POST_REF: Firebase {
        return _POST_REF
    }
   
    
    func createNewPost(post: Dictionary <String, AnyObject>) {
        
        // Save the Forum
        // FORUM_REF is the parent of the new Forum: "forums".
        // childByAutoId() saves the joke and gives it its own ID.
        
        let firebaseNewPost = POST_REF.childByAutoId()
        
        // setValue() saves to Firebase.
        
        firebaseNewPost.setValue(post)
    }
}
