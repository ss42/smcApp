//
//  Forum.swift
//  FirebaseForums
//
//  Created by Matthew Maher on 1/23/16.
//  Copyright © 2016 Matt Maher. All rights reserved.
//

import Foundation
import Firebase

class Forum {
    private var _ForumRef: Firebase!
    
    private var _ForumKey: String!
    private var _ForumText: String!
    private var _ForumVotes: Int!
    private var _username: String!
    
    var ForumKey: String {
        return _ForumKey
    }
    
    var ForumText: String {
        return _ForumText
    }
    
    var ForumVotes: Int {
        return _ForumVotes
    }
    
    var username: String {
        return _username
    }
    
    // Initialize the new Forum
    
    init(key: String, dictionary: Dictionary<String, AnyObject>) {
        self._ForumKey = key
        
        // Within the Forum, or Key, the following properties are children
        
        if let votes = dictionary["votes"] as? Int {
            self._ForumVotes = votes
        }
        
        if let Forum = dictionary["ForumText"] as? String {
            self._ForumText = Forum
        }
        
        if let user = dictionary["author"] as? String {
            self._username = user
        } else {
            self._username = ""
        }
        
        // The above properties are assigned to their key.
        
        self._ForumRef = DataService.dataService.FORUM_REF.childByAppendingPath(self._ForumKey)
    }
    
    func addSubtractVote(addVote: Bool) {
        
        if addVote {
            _ForumVotes = _ForumVotes + 1
        } else {
            _ForumVotes = _ForumVotes - 1
        }
        
        // Save the new vote total.
        
        _ForumRef.childByAppendingPath("votes").setValue(_ForumVotes)
        
    }
}

