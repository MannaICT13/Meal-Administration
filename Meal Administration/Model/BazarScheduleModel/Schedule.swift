//
//  Schedule.swift
//  Meal Administration
//
//  Created by Md Khaled Hasan Manna on 22/4/20.
//  Copyright © 2020 Md Khaled Hasan Manna. All rights reserved.
//

import Foundation

class Schedule {
    
    
    
    var name : String = ""
    var email: String = ""
    var start :String = ""
    var end :String = ""
    
    init(name: String, email: String, start: String, end: String) {
        self.name = name
        self.email = email
        self.start = start
        self.end = end
    }
    
}
