//
//  pdfCampusMapViewController.swift
//  SMC
//
//  Created by Sanjay Shrestha on 3/28/16.
//  Copyright © 2016 www.ssanjay.com. All rights reserved.
//

import UIKit

class pdfCampusMapViewController: UIViewController {

    @IBOutlet weak var campusMap: UIWebView!
    var path = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        path = NSBundle.mainBundle().pathForResource("campusMap", ofType: "pdf")!
        
        let url = NSURL.fileURLWithPath(path)
        self.campusMap.loadRequest(NSURLRequest(URL: url))

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

 

}
