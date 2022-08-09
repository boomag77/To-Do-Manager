//
//  TaskListController.swift
//  To-Do Manager
//
//  Created by Sergey on 8/7/22.
//

import UIKit

class TaskListController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        loadTasks()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    // Tasks storage
    var tasksStorage: TasksStorageProtocol = TasksStorage()
    // Tasks collection
    var tasks: [TaskPriority:[TaskProtocol]] = [:]
    var sectionsTypesPosition: [TaskPriority] = [.important, .normal]

    private func loadTasks() {
        sectionsTypesPosition.forEach { taskType in
            tasks[taskType] = []
        }
        tasksStorage.loadTasks().forEach { task in
            tasks[task.type]?.append(task)
        }
    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        var title: String?
        let tasksType = sectionsTypesPosition[section]
        if tasksType == .important {
            title = "Important"
        } else if tasksType == .normal {
            title = "Normal"
        }
        return title
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return tasks.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        let taskType = sectionsTypesPosition[section]
        guard let currentTasksType = tasks[taskType] else {
            return 0
        }
        return currentTasksType.count
    }

    // Cell for Table row
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return getConfiguredTaskCell_constraints(for: indexPath)
    }
    
    // Cell based on constraints
    private func getConfiguredTaskCell_constraints(for indexPath: IndexPath) -> UITableViewCell {
        // load cell prototype by identifier
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskCellConstraints", for: indexPath)
        // get task info for display in cell
        let taskType = sectionsTypesPosition[indexPath.section]
        guard let currentTask = tasks[taskType]?[indexPath.row] else {
            return cell
        }
        
        // symbol text label
        let symbolLabel = cell.viewWithTag(1) as? UILabel
        // task title text label
        let textLabel = cell.viewWithTag(2) as? UILabel
        
        // edit symbol in cell
        symbolLabel?.text = getSymbolForTask(with: currentTask.status)
        // edit text in cell
        textLabel?.text = currentTask.title
        
        // edit text and symbol color
        if currentTask.status == .planned {
            textLabel?.textColor = .black
            symbolLabel?.textColor = .black
        } else {
            textLabel?.textColor = .lightGray
            symbolLabel?.textColor = .lightGray
        }
        return cell
    }
    
    private func getSymbolForTask(with status: TaskStatus) -> String {
        var resultSymbol: String
        if status == .planned {
            resultSymbol = "\u{25CB}"
        } else if status == .completed {
            resultSymbol = "\u{25C9}"
        } else {
            resultSymbol = ""
        }
        return resultSymbol
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
