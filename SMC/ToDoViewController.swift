//
//  ViewController.swift
//  toDo
//
//  Created by Sanjay Shrestha on 4/8/16.
//  Copyright © 2016 www.ssanjay.com. All rights reserved.
//

import UIKit

class ToDoViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var baseArray: [[ToDoModel]] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let todo1 =  ToDoModel(title: "Study Physics", favourited: false, dueDate: NSDate(), completed: false, repeated: nil, remainder: nil)
        let todo2 =  ToDoModel(title: "Go to Gym", favourited: false, dueDate: NSDate(), completed: false, repeated: nil, remainder: nil)
        let todo3 =  ToDoModel(title: "Eat Dinner", favourited: false, dueDate: NSDate(), completed: false, repeated: nil, remainder: nil)
        baseArray = [[todo1, todo2, todo3],[]]

        tableView.dataSource = self
        tableView.delegate = self
       // NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillShow"), name: //UIKeyboardWillShowNotification, object: nil)
       // NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide", name: UIKeyboardWillHideNotification, object: nil)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    //: Mark- KeyBoard Notification 
    
    func keyboardWillShow(notification: NSNotification){
        navigationItem.rightBarButtonItem?.title = "Done"
        
    }
    func keyboardWillHide(notification : NSNotification){
        navigationItem.rightBarButtonItem?.title = "Edit"
    }
    
    
    func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        if indexPath.section == 1 {
            return true
        }
        else {
            return false
        }
    }
    func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
        let currentToDo = baseArray[0][sourceIndexPath.row]
        
        baseArray[0].removeAtIndex(sourceIndexPath.row)
        baseArray[0].insert(currentToDo, atIndex: destinationIndexPath.row)
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if  editingStyle == .Delete{
            tableView.beginUpdates()
            baseArray[indexPath.section - 1].removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
            tableView.endUpdates()
        }
    }
   
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if indexPath.section == 0{
            
            
            let cell: AddToDoTableViewCell = tableView.dequeueReusableCellWithIdentifier("AddToDoCell") as! AddToDoTableViewCell
            cell.backgroundColor = UIColor(red: 208/255, green: 198/255, blue: 177/2585, alpha: 0.7)
            return cell
            
        }
        else if indexPath.section == 1 || indexPath.section == 2{
            let currentToDo = baseArray[indexPath.section - 1][indexPath.row]
            let cell: ToDoTableViewCell = tableView.dequeueReusableCellWithIdentifier("ToDoCell") as! ToDoTableViewCell
            cell.titleLabel.text = currentToDo.title
            let dateStringFormatter = NSDateFormatter()
            dateStringFormatter.dateFormat = "yyyy-MM-dd"
            if let date = currentToDo.dueDate{
                let dateString = dateStringFormatter.stringFromDate(date)
            }
            if indexPath.section == 1 {
                cell.completeButton.backgroundColor = UIColor.redColor()
            }
            else {
                cell.completeButton.backgroundColor = UIColor.greenColor()
            }
            if currentToDo.favourited {
                cell.favouriteButton.backgroundColor = UIColor.blueColor()
                
            }
            else {
                cell.favouriteButton.backgroundColor = UIColor.yellowColor()
            }
            cell.backgroundColor = UIColor(red: 235/255, green: 176/255, blue: 53/255, alpha: 0.7)
            
            return cell
        }
        
        
        return UITableViewCell()
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {   if section == 0{
        
        return 1
    }
    else if section == 1{
        
        return baseArray[0].count
    }
    else if section == 2 {
        return baseArray[1].count
    }
    else {
        return 0
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func editPressed(sender: AnyObject) {
        
        if sender.title == "Edit"{
            if tableView.editing {
                tableView.setEditing(false, animated: true)
            }
            else {
                tableView.setEditing(true, animated: true)
            }
        }
        else if sender.title == "Done"{
            let indexPathOfAddToDoCell = NSIndexPath(forRow: 0, inSection: 0)
            
            let addToDoTableViewCell = tableView.cellForRowAtIndexPath(indexPathOfAddToDoCell) as! AddToDoTableViewCell
            if addToDoTableViewCell.addToDoTextField.text != ""{
                let newTodo = ToDoModel(title: addToDoTableViewCell.addToDoTextField.text!, favourited: addToDoTableViewCell.favorited, dueDate: nil, completed: false, repeated: nil, remainder: nil)
                baseArray[0].append(newTodo)
                tableView.reloadData()
                addToDoTableViewCell.addToDoTextField.text = ""
                addToDoTableViewCell.addToDoTextField.resignFirstResponder()
            }
            else {
                let alert = UIAlertController(title: "Invalid ToDo", message: "Please enter a title before adding a todo", preferredStyle: UIAlertControllerStyle.Alert)
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
                presentViewController(alert, animated: true, completion: nil)
            }
        }
        
    }
    
}
