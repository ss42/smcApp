//
//  PostTableViewCell.swift
//  SMC
//
//  Created by Sanjay Shrestha on 4/9/16.
//  Copyright © 2016 www.ssanjay.com. All rights reserved.
//

import UIKit



class PostTableViewCell: UITableViewCell {
    
    @IBOutlet weak var bookImage: UIImage!
    
    @IBOutlet weak var bookTitle: UILabel!
    
    @IBOutlet weak var bookDetail: UILabel!

    @IBOutlet weak var priceLabel: UILabel!
    
    @IBOutlet weak var postedTimeLabel: UILabel!
    
    /*
    var book: Books! {
        didSet {
            updateUI()
        }
    }
    
    func updateUI()
    {
        self.bookImage = UIImage(named: book.image)
        self.bookTitle.text = book.title
        self.bookDetail.text = book.description
        self.priceLabel.text = book.priceTag
        self.postedTimeLabel.text = book.postedTime
     }*/
}
