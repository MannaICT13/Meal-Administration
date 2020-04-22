//
//  BazarCostModel.swift
//  Meal Administration
//
//  Created by Md Khaled Hasan Manna on 23/4/20.
//  Copyright © 2020 Md Khaled Hasan Manna. All rights reserved.
//

import Foundation
import FirebaseFirestore

class BazarCostModel {
    
    //MARK: - Properties
    
    static let bazarCostInstance = BazarCostModel()
    
    let db = Firestore.firestore()
    
    
    
    
    //MARK: - Handler
    
    func writeCost(userEmail:String,name:String,email:String,cost:Double,date:String){
        
        let dic: [String:Any] = [
        
        
            "name":name,
            "email":email,
            "cost":cost,
            "date":date
        
        ]
        self.db.collection(userEmail).document("costDocument").collection("costCollection").document("document").collection(email).addDocument(data: dic) { (error) in
            
            if let err = error{
                
                print(err.localizedDescription)
                
            }
        }
        
        
        
        
        
    }
    
    func readCost(userEmail:String,email:String,completed:@escaping ([Cost]) ->Void){
        
        let dispatch = DispatchGroup()
        dispatch.enter()
        var cost = [Cost]()
        
        self.db.collection(userEmail).document("costDocument").collection("costCollection").document("document").collection(email).getDocuments { (snapshot, error) in
            
            if let err = error{
                print(err.localizedDescription)
            }else{
                
                for results in snapshot!.documents{
                    
                    cost.append(Cost(name: results.data()["name"] as! String, email: results.data()["email"] as! String, cost: results.data()["cost"] as! Double, date: results.data()["date"] as! String))
                    
                    
                    
                }
                
                
                
            }
            dispatch.leave()
            
        }
        dispatch.notify(queue: .main, execute: {
            print(cost.count)
            completed(cost)
        })
        
        
        
    }
    
    
    
    
    
    
    
}
