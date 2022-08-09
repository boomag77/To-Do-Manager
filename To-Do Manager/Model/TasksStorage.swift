//
//  TasksStorage.swift
//  To-Do Manager
//
//  Created by Sergey on 8/7/22.
//

import Foundation

protocol TasksStorageProtocol {
    func loadTasks() -> [TaskProtocol]
    func saveTasks(_ tasks: [TaskProtocol])
}

class TasksStorage: TasksStorageProtocol {
    func loadTasks() -> [TaskProtocol] {
        let testTasks: [TaskProtocol] = [
            Task(title: "Buy bread", status: .planned, type: .normal),
            Task(title: "Wash cat", status: .planned, type: .important),
            Task(title: "Refund to Arnold", status: .completed, type: .important),
            Task(title: "Buy new duster", status: .completed, type: .normal),
            Task(title: "To present flowers to spouse", status: .planned, type: .important),
            Task(title: "Call parents", status: .planned, type: .important)
        ]
        return testTasks
    }
    
    func saveTasks(_ tasks: [TaskProtocol]) {
        //..
    }
}
