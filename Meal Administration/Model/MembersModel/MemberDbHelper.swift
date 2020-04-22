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
    
    
    //MARK: - Properties
    static let instanceMemberDb = MemberDbHelper()
    
    var db = Firestore.firestore()
   
    
    
    //MARK: - init
    
    

    //MARK: - Handler
    
    
    // write member data to firebase firestore
    func writeMember(userEmail:String,name: String,phone:Int,address:String,email:String,rent : Int,net:Int,gass:Int,khala:Int,current:Int,water:Int,others:Int){
        
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
        
        self.db.collection(userEmail).document("memberDocument").collection("memberCollection").addDocument(data: dic) { (error) in
             
            if let err = error{
                        
                        print(err.localizedDescription)
                        
                        
                    }
            
        }

        
        
        
        
    }
    
    
    func readMember(userEmail: String,completed : @escaping ([Member]) -> Void){
        
        
        var member = [Member]()
        
        let dispatch = DispatchGroup()
        dispatch.enter()
       
        self.db.collection(userEmail).document("memberDocument").collection("memberCollection").getDocuments { (snapshort, error) in
        
            if let err = error {
                print(err.localizedDescription)
                
                
            }else{
                
                
                for result in snapshort!.documents{
                    
                    member.append(Member(name: result.data()["name"]! as! String, phone: result.data()["phone"]! as! Int, address: result.data()["address"]! as! String, email: result.data()["email"]! as! String, rent: result.data()["rent"]! as! Int , net: result.data()["net"]! as! Int, gass: result.data()["gass"]! as! Int, khala: result.data()["khala"]! as! Int, current: result.data()["khala"]! as! Int, water: result.data()["water"]! as! Int, others: result.data()["others"]! as! Int, id: result.documentID))
                    
                    //print(result.data())
                }
                
                
            }
                
                dispatch.leave()
                
            }
        
          
        dispatch.notify(queue: .main, execute: {
            
            print(member.count)
            //must use completed member
            completed(member)
            
        })
            
        }
    
    
    
    func updateMember(userEmail:String,name: String,phone:Int,address:String,email:String,rent : Int,net:Int,gass:Int,khala:Int,current:Int,water:Int,others:Int,id: String){
        
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
               
        self.db.collection(userEmail).document("memberDocument").collection("memberCollection").document(id).updateData(dic) { (error) in
         
            if let err = error{
                
                print(err.localizedDescription)
            }
        }
        
        
        
    }
    func removeMember(userEmail:String,id:String){
        self.db.collection(userEmail).document("memberDocument").collection("memberCollection").document(id).delete { (error) in
            if let err = error{
                print(err.localizedDescription)
            }
        }
        
    }
    
    
 

}
    
    
    
