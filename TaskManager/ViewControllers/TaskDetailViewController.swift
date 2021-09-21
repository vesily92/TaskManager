//
//  TaskDetailViewController.swift
//  TaskManager
//
//  Created by Василий Пронин on 20.09.2021.
//

import UIKit

class TaskDetailViewController: UITableViewController {
    
    enum TaskRow: Int, CaseIterable {
        /*
         The CaseIterable protocol provides a property named allCases
         that you can use to iterate through the cases of the conforming enumeration.
         (for example: numberOfRowsInSection method requires number of cases)
        */
        //case title
        case date
        case time
        case note
        
        func showText(for task: Task?) -> String? {
            switch self {
            //case .title: return task?.title
            case .date: return task?.date.description
            case .time: return task?.date.description
            case .note: return task?.note
            }
        }
        
        var cellImage: UIImage? {
            switch self {
            //case .title: return nil
            case .date: return UIImage(systemName: "calendar")
            case .time: return UIImage(systemName: "clock")
            case .note: return UIImage(systemName: "highlighter")
            }
        }
    }
    
    var task: Task?
    
    func configure(with task: Task) {
        /*
         When initialising a view controller from a storyboard, iOS calls the init(coder:) initialiser.
         This configure method approach is useful for configuring after initialising, such as injecting dependencies.
        */
        self.task = task
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = task?.title
    }
}

extension TaskDetailViewController {

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        TaskRow.allCases.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskDetailCell", for: indexPath)
        let row = TaskRow(rawValue: indexPath.row)
        var content = cell.defaultContentConfiguration()
        content.text = row?.showText(for: task)
        content.image = row?.cellImage
        
        cell.contentConfiguration = content

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
