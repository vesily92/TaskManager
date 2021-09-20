//
//  TaskListController.swift
//  TaskManager
//
//  Created by Василий Пронин on 20.09.2021.
//

import UIKit

class TaskListController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension TaskListController {
    
    //static var taskListCellIdentifier = "taskListCell"
    /*
     Always codify identifier strings to ensure your app doesn’t crash because of a mistyped identifier.
    */
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Task.testData.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "taskListCell", for: indexPath) as? TaskListCell else {
            fatalError("Unable to dequeue Task cell")
        }
        let task = Task.testData[indexPath.row]
        let image = task.isComplete ? UIImage(systemName: "square") : UIImage(systemName: "checkmark.square")
        
        cell.titleLabel.text = task.title
        cell.dateLabel.text = task.date.description
        cell.doneButton.setBackgroundImage(image, for: .normal)
        cell.doneButtonAction = {
            Task.testData[indexPath.row].isComplete.toggle()
            tableView.reloadRows(at: [indexPath], with: .none)
        }

        return cell
    }
}
