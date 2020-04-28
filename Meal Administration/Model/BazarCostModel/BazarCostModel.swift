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
    static let defaults = UserDefaults.standard
 
    
    
    
    
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
                
                var sum = 0.0
                for results in snapshot!.documents{
                    
                    cost.append(Cost(name: results.data()["name"] as! String, email: results.data()["email"] as! String, cost: (results.data()["cost"] as! Double), date: results.data()["date"] as! String,id:results.documentID))
                    
                    sum += results.data()["cost"] as! Double
                    
                    
                }
                print("Bazar cost... \(sum)")
                BazarCostModel.defaults.set(sum, forKey: "bazarCost")
                
                
                
                
            }
            dispatch.leave()
            
        }
        dispatch.notify(queue: .main, execute: {
            print(cost.count)
            completed(cost)
        })
        
        
        
    }
    func removeCost(userEmail:String,email:String,id:String){
        self.db.collection(userEmail).document("costDocument").collection("costCollection").document("document").collection(email).document(id).delete { (error) in
            
            if let err = error{
                print(err.localizedDescription)
                
                
            }
        }
    }
    
    func updateCost(userEmail:String,email:String,cost:Double,id:String){

        self.db.collection(userEmail).document("costDocument").collection("costCollection").document("document").collection(email).document(id).updateData([
            
            "cost":cost
            ]

            ) { (error) in
                if let err = error{
                    print(err.localizedDescription)
                }
            
            
        }
    }
    
 
   
    
    
    
    
}
