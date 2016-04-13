//
//  AddToDoTableViewCell.swift
//  toDo
//
//  Created by Sanjay Shrestha on 4/8/16.
//  Copyright © 2016 www.ssanjay.com. All rights reserved.
//

import UIKit

class AddToDoTableViewCell: UITableViewCell {

    @IBOutlet weak var addToDoTextField: UITextField!
    @IBOutlet weak var favoriteButton: UIButton!
    
    var favorited = false
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func favouriteButtonTapped(sender: AnyObject) {
    }

}
