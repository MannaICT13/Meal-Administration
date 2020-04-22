//
//  BazarScheduleDbModel.swift
//  Meal Administration
//
//  Created by Md Khaled Hasan Manna on 22/4/20.
//  Copyright © 2020 Md Khaled Hasan Manna. All rights reserved.
//

import Foundation
import FirebaseFirestore

class BazarScheduleDbModel {
    
static let bazarScheduleInstance = BazarScheduleDbModel()
    
    
    
    let db = Firestore.firestore()
    
    
    func readSchedule(userEmail:String,name:String,email:String,start:String,end:String){
        
        let dic : [String :Any ] = [
        
            "name" : name,
            "email":email,
            "start" : start,
            "end" : end
        
        ]
        self.db.collection(userEmail).document("scheduleDocument").collection("scheduleCollection").document(email).setData(dic) { (error) in
            if let  err = error{
                print(err.localizedDescription)
                
                
            }
        }
        
        
        
        
        
        
    }
    
    
    
    
    
    
    
    
}
