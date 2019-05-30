//
//  EditHabitsViewController
//  Habit Tracker
//
//  Created by caar on 29.05.19.
//  Copyright © 2019 Caar. All rights reserved.
//

import UIKit
import RealmSwift

class HabitsConfigurationViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let controller = HabitController()
    
    @IBOutlet weak var habitName: UITextField!
    
    @IBOutlet weak var tableViewHabits: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewHabits.delegate = self
        tableViewHabits.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return controller.getHabitsCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = controller.getHabitNameFor(indexPath.row)
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete{
            
            controller.deleteHabit(indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
        }
    }
    
    @IBAction func addHabit(_ sender: Any) {
        controller.addNewHabit(habitName.text!, 0)
        self.tableViewHabits.insertRows(at: [IndexPath(row: controller.getHabitsCount()-1, section: 0)], with: UITableView.RowAnimation.automatic)
    }
    
    
    
    
}

