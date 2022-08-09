//
//  Task.swift
//  To-Do Manager
//
//  Created by Sergey on 8/7/22.
//

import Foundation

enum TaskPriority {
    case normal
    case important
}

enum TaskStatus {
    case planned
    case completed
}

protocol TaskProtocol {
    var title: String { get set }
    var status: TaskStatus { get set }
    var type: TaskPriority { get set }
}

struct Task: TaskProtocol {
    var title: String
    var status: TaskStatus
    var type: TaskPriority
}
