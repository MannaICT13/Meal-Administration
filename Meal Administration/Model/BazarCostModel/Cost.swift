//
//  Cost.swift
//  Meal Administration
//
//  Created by Md Khaled Hasan Manna on 23/4/20.
//  Copyright © 2020 Md Khaled Hasan Manna. All rights reserved.
//

import Foundation

class Cost{
   
    
    var name :String = ""
    var email :String = ""
    var cost :Double = 0.0
    var date :String = ""
    var id : String = ""
       
    
    init(name: String, email: String, cost: Double, date: String,id:String) {
           self.name = name
           self.email = email
           self.cost = cost
           self.date = date
           self.id = id
       }
       
    
}
