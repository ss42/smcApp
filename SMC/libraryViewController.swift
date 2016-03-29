//
//  libraryViewController.swift
//  SMC
//
//  Created by Sanjay Shrestha on 3/28/16.
//  Copyright © 2016 www.ssanjay.com. All rights reserved.
//

import UIKit
import WebKit


class libraryViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let urlAddress = NSURL(string: "https://www.google.com")
        
        let request = NSURLRequest(URL: urlAddress!)
        
        self.webView.loadRequest(request)
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
