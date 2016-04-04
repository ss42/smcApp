//
//  AddNewPostViewController.swift
//  SMC
//
//  Created by Sanjay Shrestha on 4/3/16.
//  Copyright © 2016 www.ssanjay.com. All rights reserved.
//


import UIKit
import Firebase

class AddNewPostViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
   // @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var postDescriptions: UITextView!
    
    
    let firebase = Firebase(url:"https://smc-essentials.firebaseio.com/profiles")
    
   /// var imagePicker: UIImagePickerController = UIImagePickerController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func save(sender: AnyObject) {

        let name = nameTextField.text
        let description = postDescriptions.text
       /*** var data: NSData = NSData()

        if let image = photoImageView.image {
           data = UIImageJPEGRepresentation(image,0.1)!
        }
        
        let base64String = data.base64EncodedStringWithOptions(NSDataBase64EncodingOptions.Encoding64CharacterLineLength)**/

        let user: NSDictionary = ["name":name!,"description": description!]//, "photoBase64":base64String]
        
        //add firebase child node
        let profile = firebase.ref.childByAppendingPath(name!)
        
        // Write data to Firebase
        profile.setValue(user)
        
        navigationController?.popViewControllerAnimated(true)
    }
  
 
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        view.endEditing(true)
        super.touchesBegan(touches, withEvent: event)
    }
}
/**

extension AddNewPostViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // MARK:- UIImagePickerControllerDelegate methods
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        imagePicker.dismissViewControllerAnimated(true, completion: nil)
        photoImageView.image = info[UIImagePickerControllerOriginalImage] as? UIImage
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    // MARK:- Add Picture
    
    @IBAction func addPicture(sender: AnyObject) {
        
        if(UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera)) {
            imagePicker =  UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .Camera
            
            presentViewController(imagePicker, animated: true, completion: nil)
        } else {
            imagePicker.allowsEditing = false
            imagePicker.sourceType = .PhotoLibrary
            imagePicker.delegate = self
            presentViewController(imagePicker, animated: true, completion:nil)
        }
    }
}
**/