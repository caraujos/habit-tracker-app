//
//  Habit.swift
//  Habit Tracker
//
//  Created by caar on 29.05.19.
//  Copyright © 2019 Caar. All rights reserved.
//

import Foundation
import RealmSwift


class Habit: Object{
    @objc dynamic var name = ""
    @objc dynamic var progress = 0
    @objc dynamic var month = 0
}
