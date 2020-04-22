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
    
    
    
    
    
    
    
}
