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
    
    private var doneButtonAction: DoneButtonAction?
    
    @IBAction func doneButtonTapped(_ sender: UIButton) {
        doneButtonAction?()
    }
    
    func configure(title: String,
                   dateText: String,
                   isDone: Bool,
                   doneButtonAction: @escaping DoneButtonAction) {
        
        /*
         A closure parameter needs an @escaping annotation when the closure is stored and executed after the function returns.
         */
        
        titleLabel.text = title
        dateLabel.text = dateText
        let image = isDone
            ? UIImage(systemName: "square")
            : UIImage(systemName: "checkmark.square")?
                .withTintColor(.systemGreen, renderingMode: .alwaysOriginal)
        doneButton.setBackgroundImage(image, for: .normal)
        self.doneButtonAction = doneButtonAction
        
    }
}
