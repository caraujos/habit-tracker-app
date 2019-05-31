//
//  HabitTableViewCell.swift
//  Habit Tracker
//
//  Created by Netlight on 31.05.19.
//  Copyright © 2019 Caar. All rights reserved.
//

import UIKit

class HabitTableViewCell: UITableViewCell {
    
    let controller = HabitController()
    let progress = Progress(totalUnitCount: 30)
    var tap:UITapGestureRecognizer!
    var currentRow:Int = 0
    
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var habitProgressView: UIProgressView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        addTapGesture(view: cardView)
    }
    
    func addTapGesture(view:UIView){
        tap = UITapGestureRecognizer(target: self, action: #selector(HabitTableViewCell.handleTouchHabitCard(sender:)))
        view.addGestureRecognizer(tap)
    }

    func setUp(_ row:Int){
        currentRow = row
        cardView.backgroundColor = UIColor.orange
        cardView.layer.cornerRadius = 15.0
        titleLabel.text = controller.getHabitNameFor(row)
    }
    
    @objc func handleTouchHabitCard(sender:UITapGestureRecognizer) {
        cardView.backgroundColor = UIColor.green
        cardView.removeGestureRecognizer(tap)
        completeDailyProgress()
    }
    
    func completeDailyProgress(){
        self.progress.completedUnitCount += 1
        self.habitProgressView.setProgress(Float(self.progress.fractionCompleted), animated: true)
    }
    
    func formatDateWith(_ date:Date)->Date{
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = DateFormatter.Style.none
        dateFormatter.dateStyle = DateFormatter.Style.short
        return dateFormatter.date(from: dateFormatter.string(from: date)) ?? Date()
    }
    

}
