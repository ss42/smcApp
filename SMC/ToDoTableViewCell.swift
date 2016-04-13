//
//  ToDoTableViewCell.swift
//  toDo
//
//  Created by Sanjay Shrestha on 4/8/16.
//  Copyright © 2016 www.ssanjay.com. All rights reserved.
//

import UIKit

class ToDoTableViewCell: UITableViewCell {

    @IBOutlet weak var completeButton: UIButton!
    
    @IBOutlet weak var favouriteButton: UIButton!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func favoriteButtonTapped(sender: AnyObject) {
        
        
        
    }

    @IBAction func completeButtonTapped(sender: AnyObject) {
        
        
        
    }
}
