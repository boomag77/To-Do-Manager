//
//  TaskCell.swift
//  To-Do Manager
//
//  Created by Sergey on 8/9/22.
//

import UIKit

class TaskCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBOutlet var symbol: UILabel!
    @IBOutlet var title: UILabel!
    

}
