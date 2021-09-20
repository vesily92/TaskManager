//
//  Task.swift
//  TaskManager
//
//  Created by Василий Пронин on 20.09.2021.
//

import Foundation

struct Task {
    var title: String
    var date: Date
    var note: String? = nil
    var isComplete: Bool = false
}

extension Task {
    static var testData =
        [
            Task(title: "Buy milk", date: Date().addingTimeInterval(800.0), note: "1.8% lactose-free"),
            Task(title: "Check gas meter", date: Date().addingTimeInterval(14000.0), note: "Make some photos to send my mom", isComplete: true)
    ]
}
