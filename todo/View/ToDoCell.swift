//
//  ToDoCell.swift
//  todo
//
//  Created by Jody Abney on 5/7/20.
//  Copyright © 2020 AbneyAnalytics. All rights reserved.
//

import UIKit

class ToDoCell: UITableViewCell {

    @IBOutlet weak var itemLabel: UILabel!
    @IBOutlet weak var priorityView: UIView!
    

    func upateCell(todo: ToDo) {
        itemLabel.text = todo.item
        
        switch todo.priority {
        case 0:
            priorityView.backgroundColor = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
        case 1:
            priorityView.backgroundColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
        case 2:
            priorityView.backgroundColor = #colorLiteral(red: 1, green: 0, blue: 0.005114686675, alpha: 1)
        default:
            break
        }
    }

}
