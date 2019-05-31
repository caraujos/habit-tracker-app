//
//  TrackerViewController.swift
//  Habit Tracker
//
//  Created by Netlight on 30.05.19.
//  Copyright © 2019 Caar. All rights reserved.
//

import UIKit

class TrackerViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    let controller = HabitController()
    
    @IBOutlet weak var tableViewHabits: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewHabits.dataSource = self
        tableViewHabits.delegate = self
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return controller.getHabitsCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let habitCell = tableView.dequeueReusableCell(withIdentifier: "habitCell", for: indexPath) as! HabitTableViewCell
        habitCell.setUp(indexPath.row)
        return habitCell
    }
    
    
}

