//
//  JokesFeedTableViewController.swift
//  FirebaseJokes
//
//  Created by Matthew Maher on 1/23/16.
//  Copyright © 2016 Matt Maher. All rights reserved.
//

import UIKit
import Firebase

class ForumFeedTableViewController: UITableViewController {
    
    var forums = [Forum]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // observeEventType is called whenever anything changes in the Firebase - new Jokes or Votes.
        // It's also called here in viewDidLoad().
        // It's always listening.
        
        DataService.dataService.JOKE_REF.observeEventType(.Value, withBlock: { snapshot in
            
            // The snapshot is a current look at our jokes data.
            
            print(snapshot.value)
            
            self.forums = []
            
            if let snapshots = snapshot.children.allObjects as? [FDataSnapshot] {
                
                for snap in snapshots {
                    
                    // Make our jokes array for the tableView.
                    
                    if let postDictionary = snap.value as? Dictionary<String, AnyObject> {
                        let key = snap.key
                        let forum = Forum(key: key, dictionary: postDictionary)
                        
                        // Items are returned chronologically, but it's more fun with the newest jokes first.
                        
                        self.forums.insert(forum, atIndex: 0)
                    }
                }
                
            }
            
            // Be sure that the tableView updates when there is new data.
            
            self.tableView.reloadData()
        })
        

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return forums.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let forum = forums[indexPath.row]
        
        // We are using a custom cell.
        
        if let cell = tableView.dequeueReusableCellWithIdentifier("ForumCellTableViewCell") as? ForumCellTableViewCell {
            
            // Send the single joke to configureCell() in JokeCellTableViewCell.
            
            cell.configureCell(forum)
            
            return cell
            
        } else {
            
            return ForumCellTableViewCell()
            
        }
        
    }
    
    
}