//
//  ToDoModel.swift
//  toDo
//
//  Created by Sanjay Shrestha on 4/8/16.
//  Copyright © 2016 www.ssanjay.com. All rights reserved.
//

import Foundation


enum RepeatType: Int{
    case Daily = 0
    case Weekly = 1
    case Monthly = 2
    case Yearly = 3
}

struct ToDoModel {
    var title: String
    var favourited: Bool
    var dueDate: NSDate?
    var completed: Bool
    
    var repeated: RepeatType?
    
    var remainder: NSDate?
    
    
}