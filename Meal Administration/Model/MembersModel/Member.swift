//
//  Member.swift
//  Meal Administration
//
//  Created by Md Khaled Hasan Manna on 16/4/20.
//  Copyright © 2020 Md Khaled Hasan Manna. All rights reserved.
//

import Foundation

class Member {
    
   
    var name: String?
    var phone: Int?
    var address: String?
    var email: String?
    var rent: Int?
    var net: Int?
    var gass: Int?
    var khala: Int?
    var current: Int?
    var water: Int?
    var others: Int?
    var id : String?
    
    
    init(name: String?, phone: Int?, address: String?, email: String?, rent: Int?, net: Int?, gass: Int?, khala: Int?, current: Int?, water: Int?, others: Int?,id : String?) {
           
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
