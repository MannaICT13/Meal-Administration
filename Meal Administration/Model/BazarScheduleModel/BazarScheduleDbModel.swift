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
    
    func writeSchedule(userEmail:String,name:String,email:String,start:String,end:String){
        
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
    
    func readSchedule(userEmail:String,completed : @escaping ([Schedule]) -> Void){
        
        
        
        let dispatch = DispatchGroup()
        dispatch.enter()
        var schedule = [Schedule]()
        
        self.db.collection(userEmail).document("scheduleDocument").collection("scheduleCollection").getDocuments { (snapshot, error) in
            
            if let err = error {
                
                print(err.localizedDescription)
            }else{
                
                for results in snapshot!.documents{
                    
                    
                    schedule.append(Schedule(name: results.data()["name"] as! String, email: results.data()["email"] as! String, start: results.data()["start"] as! String, end: results.data()["end"] as! String))
                    
                    
                }
                
                
                
                
            }
            
            dispatch.leave()
            
            
        }
        
        dispatch.notify(queue: .main, execute: {
            print(schedule.count)
            completed(schedule)
            
        })
        
        
        
        
        
        
        
    }
    
    
    
    
    
    
    
    
}
