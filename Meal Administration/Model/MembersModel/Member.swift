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
    var phone: Int = 0
    var address: String = ""
    var email: String = ""
    var rent: Int = 0
    var net: Int = 0
    var gass: Int = 0
    var khala: Int = 0
    var current: Int = 0
    var water: Int = 0
    var others: Int = 0
    var id : String = ""
    
    
    init(name: String, phone: Int, address: String, email: String, rent: Int, net: Int, gass: Int, khala: Int, current: Int, water: Int, others: Int,id : String) {
           
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
