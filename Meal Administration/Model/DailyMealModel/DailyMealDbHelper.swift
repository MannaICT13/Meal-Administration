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
    
    func writeMeal(userEmail:String,name:String,email:String,meal:Double,date : String){
        
        
        let dic : [String:Any] = [
        
            "userEmail":userEmail,
            "name":name,
            "email":email,
            "meal":meal,
            "date":date
       
        ]
        
        self.db.collection(userEmail).document("mealDocument").collection("mealCollection").document("document").collection(email).addDocument(data: dic) { (error) in
            
            if let err = error{
                
                print(err.localizedDescription)
                
            }
            
            
            
        }
            
            
            
        }
    
    
    
    
    func readMeal(userEmail:String,email:String,completed : @escaping ([Meal]) ->Void ){
        
       
        let dispatch = DispatchGroup()
        dispatch.enter()
         var meal = [Meal]()
        self.db.collection(userEmail).document("mealDocument").collection("mealCollection").document("document").collection(email).getDocuments{ (snapshot, error) in
            
            if let err = error{
                
                print(err.localizedDescription)
                
                
            }else{
                
                for results in snapshot!.documents{
                    
                    meal.append(Meal(name: results.data()["name"] as! String, email: results.data()["email"] as! String, meal: results.data()["meal"] as! Double, date: results.data()["date"] as! String))
                }
                
                
                
                
            }
            dispatch.leave()
            
            
        
        }
        dispatch.notify(queue: .main, execute: {
            print(meal.count)
            completed(meal)
        })
        
        
        
    }
    
        
        
        
    }
    
    
    
    
    
    
    
    

