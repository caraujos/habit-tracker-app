//
//  HabitController.swift
//  Habit Tracker
//
//  Created by caar on 29.05.19.
//  Copyright © 2019 Caar. All rights reserved.
//

import Foundation
import RealmSwift


class HabitController{
    let realm = try! Realm()
    
    func getHabitsCount() -> Int{
        return realm.objects(Habit.self).filter("month = 0").count
    }
    
    func getHabitsList() -> Results<Habit>{
        return realm.objects(Habit.self).filter("month = 0")
    }
    
    func addNewHabit(_ name:String, _ month:Int){
        let habit = Habit()
        habit.name = name
        habit.month = month
        try! self.realm.write {
            self.realm.add(habit)
        }
    }
    
    func deleteHabit (_ index:Int){
        try! self.realm.write {
            self.realm.delete(getHabitsList()[index])
        }
    }
    
    func getHabitNameFor(_ row:Int)->String?{
        return realm.objects(Habit.self).filter("month=0")[row].name
    }
    
}
