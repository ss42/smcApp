//
//  ForumCellTableViewCell.swift
//  FirebaseForums
//
//  Created by Matthew Maher on 1/23/16.
//  Copyright © 2016 Matt Maher. All rights reserved.
//

import UIKit
import Firebase

class ForumCellTableViewCell: UITableViewCell {
    
    @IBOutlet weak var ForumText: UITextView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var totalVotesLabel: UILabel!
    @IBOutlet weak var thumbVoteImage: UIImageView!
    
    var forum: Forum!
    var voteRef: Firebase!
    
    func configureCell(forum: Forum) {
        self.forum = forum
        
        // Set the labels and textView.
        
        self.ForumText.text = forum.ForumText
        self.totalVotesLabel.text = "Total Votes: \(forum.ForumVotes)"
        self.usernameLabel.text = forum.username
        
        // Set "votes" as a child of the current user in Firebase and save the Forum's key in votes as a boolean.
        
        voteRef = DataService.dataService.USER_REF.childByAppendingPath("votes").childByAppendingPath(forum.ForumKey)
        
        // observeSingleEventOfType() listens for the thumb to be tapped, by any user, on any device.
        
        voteRef.observeSingleEventOfType(.Value, withBlock: { snapshot in
            
            // Set the thumb image.
            
            if let thumbsUpDown = snapshot.value as? NSNull {
                
                // Current user hasn't voted for the Forum... yet.
                
                print(thumbsUpDown)
                self.thumbVoteImage.image = UIImage(named: "thumb-down")
            } else {
                
                // Current user voted for the Forum!
                
                self.thumbVoteImage.image = UIImage(named: "thumb-up")
            }
        })
    }
    
    func voteTapped(sender: UITapGestureRecognizer) {
        
        // observeSingleEventOfType listens for a tap by the current user.
        
        voteRef.observeSingleEventOfType(.Value, withBlock: { snapshot in
            
            if let thumbsUpDown = snapshot.value as? NSNull {
                print(thumbsUpDown)
                self.thumbVoteImage.image = UIImage(named: "thumb-down")
                
                // addSubtractVote(), in Forum.swift, handles the vote.
                
                self.forum.addSubtractVote(true)
                
                // setValue saves the vote as true for the current user.
                // voteRef is a reference to the user's "votes" path.
                
                self.voteRef.setValue(true)
            } else {
                self.thumbVoteImage.image = UIImage(named: "thumb-up")
                self.forum.addSubtractVote(false)
                self.voteRef.removeValue()
            }
            
        })
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // UITapGestureRecognizer is set programatically.
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(ForumCellTableViewCell.voteTapped(_:)))
        tap.numberOfTapsRequired = 1
        thumbVoteImage.addGestureRecognizer(tap)
        thumbVoteImage.userInteractionEnabled = true
    }

}
