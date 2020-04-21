//
//  DailyMealDbHelper.swift
//  Meal Administration
//
//  Created by Md Khaled Hasan Manna on 21/4/20.
//  Copyright © 2020 Md Khaled Hasan Manna. All rights reserved.
//

import Foundation
import FirebaseFirestore

class DailyMealDbHelper {
    
    
    static let dailyMealDbInstance = DailyMealDbHelper()
    
    let db = Firestore.firestore()
    
    func writeMeal(userEmail:String,name:String,email:String,meal:Int,date : String){
        
        
        let dic : [String:Any] = [
        
            "userEmail":userEmail,
            "name":name,
            "email":email,
            "meal":meal,
            "date":date
       
        ]
        
        self.db.collection(userEmail).document("mealDocument").collection("mealCollection").document(email+"document").collection(email).addDocument(data: dic) { (error) in
            
            if let err = error{
                
                print(err.localizedDescription)
                
            }
            
            
            
        }
            
            
            
        }
        
        
        
    }
    
    
    
    
    
    
    
    

