//
//  Member.swift
//  Meal Administration
//
//  Created by Md Khaled Hasan Manna on 16/4/20.
//  Copyright © 2020 Md Khaled Hasan Manna. All rights reserved.
//

import Foundation

class Member {
    
   
    var name: String = ""
    var phone: String = ""
    var address: String = ""
    var email: String = ""
    var rent: Double = 0.0
    var net: Double = 0.0
    var gass: Double = 0.0
    var khala: Double = 0.0
    var current: Double = 0.0
    var water: Double = 0.0
    var others: Double = 0.0
    var id : String = ""
    
    
    init(name: String, phone: String, address: String, email: String, rent: Double, net: Double, gass: Double, khala: Double, current: Double, water: Double, others: Double,id : String) {
           
           self.name = name
           self.phone = phone
           self.address = address
           self.email = email
           self.rent = rent
           self.net = net
           self.gass = gass
           self.khala = khala
           self.current = current
           self.water = water
           self.others = others
           self.id = id
       }
       
    
    
    
    
}
