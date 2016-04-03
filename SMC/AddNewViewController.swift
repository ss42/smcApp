//
//  AddJokeViewController.swift


import UIKit
import Firebase

class AddNewViewController: UIViewController {
    
    @IBOutlet weak var newTextField: UITextField!
    var currentUsername = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
   
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    @IBAction func saveJoke(sender: AnyObject) {
        let newText = newTextField.text
        
        if newText != "" {
            
            // Build the new Joke.
            // AnyObject is needed because of the votes of type Int.
            
            let newJoke: Dictionary<String, AnyObject> = [
                "newText": newText!,
                "votes": 0,
                "author": currentUsername
            ]
            
            // Send it over to DataService to seal the deal.
            
              DataService.dataService.createNewForum(newJoke)
            
            if let navController = self.navigationController {
                navController.popViewControllerAnimated(true)
            }
        }
    }

}
