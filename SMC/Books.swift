//
//  Books.swift
//  SMC
//
//  Created by Sanjay Shrestha on 4/9/16.
//  Copyright © 2016 www.ssanjay.com. All rights reserved.
//

import UIKit

class Books
{
    var title = ""
    var description = ""
    var image = ""
    var priceTag = ""
    var postedTime = ""
    
    init(title: String, description: String, image: String, priceTag: String, postedTime: String)
    {
        self.title = title
        self.description = description
        self.image = image
        self.priceTag = priceTag
        self.postedTime = postedTime
        
    }
    
    
}
