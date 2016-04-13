//
//  AddNewPostViewController.swift
//  SMC
//
//  Created by Sanjay Shrestha on 4/3/16.
//  Copyright © 2016 www.ssanjay.com. All rights reserved.
//


import UIKit
import Firebase
import MobileCoreServices

class AddNewPostViewController: UIViewController {

    @IBOutlet weak var postTitle: UITextField!
   // @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var postDetail: UITextView!
    
    @IBOutlet weak var imageDisplay: UIImageView!
    
    let firebase = Firebase(url:"https://smc-essentials.firebaseio.com/profiles")
    
    @IBOutlet weak var priceTextField: UITextField!
   /// var imagePicker: UIImagePickerController = UIImagePickerController()
    
    var newPost: Books?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
    
    @IBAction func takePhotoTapped(sender: AnyObject) {
        
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .Camera
        presentViewController(picker, animated: true, completion: nil)
        
        
    }
    
   
    @IBAction func uploadTapped(sender: AnyObject) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .PhotoLibrary
        presentViewController(picker, animated: true, completion: nil)
        
    }
    @IBAction func postTitleTapped(sender: AnyObject) {
        newPost?.title = postTitle.text!
    }
    
    
    @IBAction func priceTextViewTapped(sender: AnyObject) {
        newPost?.title = priceTextField.text!
    }
    
    func displayMyAlertMessage(title: String, message: String) {
        let myAlert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        let okAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil)
        myAlert.addAction(okAction)
        self.presentViewController(myAlert, animated: true, completion: nil);
    }
    
    func savedImageAlert(){
        displayMyAlertMessage("photo saved", message: "Phooto saved to photoroll")
    }
   
    @IBAction func save(sender: AnyObject) {

        let name = postTitle.text
        let description = postDetail.text
       /*** var data: NSData = NSData()

        if let image = photoImageView.image {
           data = UIImageJPEGRepresentation(image,0.1)!
        }
        
        let base64String = data.base64EncodedStringWithOptions(NSDataBase64EncodingOptions.Encoding64CharacterLineLength)**/

        let user: NSDictionary = ["name":name!,"description": description!]//, "photoBase64":base64String]
        
        //add firebase child node
        //let profile = firebase.ref.childByAppendingPath(name!)
        
        // Write data to Firebase
       // profile.setValue(user)
        
        navigationController?.popViewControllerAnimated(true)
    }
  
 
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        view.endEditing(true)
        super.touchesBegan(touches, withEvent: event)
    }
}


extension AddNewPostViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        
         imageDisplay.image = image
         
        let imageData = UIImagePNGRepresentation(image)
        
        
         let base64String = imageData!.base64EncodedStringWithOptions(NSDataBase64EncodingOptions.Encoding64CharacterLineLength)
         //
        
         print("here")
         print(base64String)
         print("saved")
        
        newPost?.image = base64String
        
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
        self.savedImageAlert()
        dismissViewControllerAnimated(true, completion: nil)

    }
    
    // MARK:- UIImagePickerControllerDelegate methods
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
       
        
        
        imageDisplay.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        
        let imageToSave: UIImage = (info[UIImagePickerControllerOriginalImage] as? UIImage)!
        
        var data: NSData = NSData()
        
        if let image = imageDisplay.image {
            data = UIImageJPEGRepresentation(image, 0.75)!
        }
        
        var base64String = data.base64EncodedStringWithOptions(NSDataBase64EncodingOptions.Encoding64CharacterLineLength)
       //newPost?.image = base64String
        
        //UIImageWriteToSavedPhotosAlbum(imageToSave, nil, nil, nil)
        //self.savedImageAlert()
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    //read abd decode
    /*imageRef.observeEventType(.Value, withBlock: { snapshot in
     
     let base64EncodedString = snapshot.value
     let imageData = NSData(base64EncodedString: base64EncodedString as! String,
     options: NSDataBase64DecodingOptions.IgnoreUnknownCharacters)
     let decodedImage = NSImage(data:imageData!)
     self.myImageView.image = decodedImage
     
     }, withCancelBlock: { error in
     print(error.description)
     })*/
    
  
}


extension AddNewPostViewController: UITextViewDelegate{
    func textView(textView: UITextView, shouldChangeTextInRange range: NSRange, replacementText text: String) -> Bool {
        if "\n" == text {
            
            newPost?.description = postDetail.text
            // dismiss the keyboard
            textView.resignFirstResponder()
            // don't insert the return
            print("keyboard dismissed")
            return false
        } else {
            return true
        }
    }
}