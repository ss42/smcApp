//
//  ListTableViewController.swift
//  SMC
//
//  Created by Sanjay Shrestha on 4/3/16.
//  Copyright © 2016 www.ssanjay.com. All rights reserved.
//


import UIKit

//import Firebase

class ListTableViewController: UITableViewController {
    
    let booksForSale = Post.temporaryPost()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
       //tems = [NSDictionary]()
        
        //loadDataFromFirebase()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
/**
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return booksForSale.count
    }
**/
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return booksForSale.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCellWithIdentifier("profileCell") as! PostTableViewCell
       
        
        let post = booksForSale[indexPath.row]
        
        
        //Configure each cell
        cell.bookImage = UIImage(named: post.image)
        cell.bookTitle.text = post.title
        cell.bookDetail.text = post.description
        cell.priceLabel.text = post.priceTag
        cell.postedTimeLabel.text = post.postedTime
      
        
        //  let base64String = dict["photoBase64"] as! String
     //   populateImage(cell, imageString: base64String)
      //  tableViewStyle(cell)
        
        return cell
    }
       /**
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            
            let dict = items[indexPath.row]
            let name = dict["name"] as! String
            
            // delete data from firebase
            
            //let profile = firebase.ref.childByAppendingPath(name)
         //   profile.removeValue()
        }
    }
    
    
        
        
  
        
        //MARK:- Populate Image
    
    func populateImage(cell:UITableViewCell, imageString: String) {
        
        let decodedData = NSData(base64EncodedString: imageString, options: NSDataBase64DecodingOptions.IgnoreUnknownCharacters)
        
        let decodedImage = UIImage(data: decodedData!)
        
        cell.imageView!.image = decodedImage
        
    }
    
  
    // MARK:- Apply TableViewCell Style
    
    func tableViewStyle(cell: UITableViewCell) {
       // cell.contentView.backgroundColor = backgroundColor
        //cell.backgroundColor = backgroundColor
        
        cell.textLabel?.font =  UIFont(name: "HelveticaNeue-Medium", size: 15)
     //   cell.textLabel?.textColor = textColor
    //    cell.textLabel?.backgroundColor = backgroundColor
        
        cell.detailTextLabel?.font = UIFont.boldSystemFontOfSize(15)
        cell.detailTextLabel?.textColor = UIColor.grayColor()
    //    cell.detailTextLabel?.backgroundColor = backgroundColor
    }
    
    // MARK:- Load data from Firebase
    
    func loadDataFromFirebase() {
        
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
        
        firebase.observeEventType(.Value, withBlock: { snapshot in
            var tempItems = [NSDictionary]()
            
            for item in snapshot.children {
                let child = item as! FDataSnapshot
                let dict = child.value as! NSDictionary
                tempItems.append(dict)
            }
            
            self.items = tempItems
            self.tableView.reloadData()
            UIApplication.sharedApplication().networkActivityIndicatorVisible = false
            
        })
    }**/
}