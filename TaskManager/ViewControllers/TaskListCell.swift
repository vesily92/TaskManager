//
//  TaskListCell.swift
//  TaskManager
//
//  Created by Василий Пронин on 20.09.2021.
//

import UIKit

class TaskListCell: UITableViewCell {
    typealias DoneButtonAction = () -> Void
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    @IBOutlet var doneButton: UIButton!
    
    var doneButtonAction: DoneButtonAction?
    
    @IBAction func doneButtonTapped(_ sender: UIButton) {
        doneButtonAction?()
    }
}
