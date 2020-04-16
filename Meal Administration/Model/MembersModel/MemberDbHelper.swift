//
//  MemberDbHelper.swift
//  Meal Administration
//
//  Created by Md Khaled Hasan Manna on 16/4/20.
//  Copyright © 2020 Md Khaled Hasan Manna. All rights reserved.
//

import Foundation
import FirebaseFirestore
import Firebase

class MemberDbHelper {
    
    
    static let instanceMemberDb = MemberDbHelper()
    
    var db = Firestore.firestore()
    let userId = LoginViewController.userEmail
    
   
    
    func writeMember(name: String,phone:Int,address:String,email:String,rent : Int,net:Int,gass:Int,khala:Int,current:Int,water:Int,others:Int){
        
        let dic : [String : Any] = [
        
            "name"   : name,
            "phone"  : phone,
            "address": address,
            "email"  : email,
            "rent"   : rent,
            "net"    : net,
            "gass"   : gass,
            "khala"  : khala,
            "current": current,
            "water"  : water,
            "others" : others
            
            
        
        ]
        
        
        db.collection(userId).document(email).setData(dic) { (error) in
           
            if let err = error{
                
                print(err.localizedDescription)
                
                
            }
        }
        

        
        
        
        
    }
    
    
    
    
    
    
    
}
