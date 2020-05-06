//
//  ContainerViewController.swift
//  Meal Administration
//
//  Created by Md Khaled Hasan Manna on 13/4/20.
//  Copyright © 2020 Md Khaled Hasan Manna. All rights reserved.
//

import UIKit
import FirebaseAuth
class ContainerViewController: UIViewController {

    
    //MARK: - Properties
    
    var homeController : HomeViewController!
    var centerController : UIViewController!
    var menuController : MenuViewController!
    
    
    var isExtended : Bool = false
    var userEmail = String()

    //MARK: - init
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.hidesBackButton = true
        self.title = "Meal Administration"
        homeConfiguration()
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        
        return .lightContent
    }
    
    //MARK: - Handler
    
    func homeConfiguration(){
        
       homeController = HomeViewController()
        centerController = UINavigationController(rootViewController: homeController)
        homeController.delegate = self
        view.addSubview(centerController.view)
        addChild(centerController)
        centerController.didMove(toParent: self)
        
        
    }
    
    func menuConfiguration(){
        
        if menuController == nil{

           
             menuController = MenuViewController()
             menuController.deleagte = self
            view.insertSubview(menuController.view, at: 0)
            addChild(menuController)
            menuController.didMove(toParent: self)
            
            
            
        }
        
       
        
        
    }
    
    func didSeletMenu(menuOption : MenuOption?){
        
        switch menuOption {
    
        case .members:
            print("Member")
            didSelectMembers()
            
            
        case .bazarSchedule:
            print("Bazar Schedule")
            didSelectBazarSchedule()
            
            
        case .bazarCost:
            print("Bazar Cost")
            didSlectBazarCost()
            
        case .dailyMealCount:
            print("Daily Meal Count")
            didSelectDailyMealCount()
            
        case .calculation:
            print("Calculation")
            didSelectCalculation()
            
            
        case .logout:
            print("Logout")
            didSeletLogOut()
    
        case .none:
            break
        }
    }
    
    
    
    
    
    
    func animatePanel(extended : Bool,menuOpion: MenuOption?){
        
         if extended{
                   
                   //Show manu
                   UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                       
                       self.centerController.view.frame.origin.x = self.centerController.view.frame.width - 80
                       
                       
                   }, completion: nil)
                   
                   
               }else{
                   //hide menu
                /*   UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                       
                       self.centerController.view.frame.origin.x = 0
                   }, completion: nil)
                   
                  */
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                
                   self.centerController.view.frame.origin.x = 0
            }) { (_) in
                
                guard menuOpion != nil else{return}
                self.didSeletMenu(menuOption: menuOpion)
            }
                   
                   
                   
               }
               
               
               
        
    }
    
    


}

extension ContainerViewController : HomeControllerDelegate{
   
    
    
    func handleToggle(menuOption: MenuOption?) {
        
        if !isExtended{
            
            menuConfiguration()
        }
        isExtended = !isExtended
        
        animatePanel(extended: isExtended, menuOpion: menuOption)
        
        
    }
    
  
    
    
}

extension ContainerViewController {
    
    
    func didSelectMembers(){
        
        let membersVC = storyboard?.instantiateViewController(identifier: "MembersViewController") as! MembersViewController
        membersVC.userEmail = self.userEmail
        
        self.navigationController?.pushViewController(membersVC, animated: true)
        
        
        
    }
    
    func didSelectBazarSchedule(){
         
        let addScheduleVC = storyboard?.instantiateViewController(identifier: "BazarScheduleViewController") as! BazarScheduleViewController
        addScheduleVC.userEmail = self.userEmail
        self.navigationController?.pushViewController(addScheduleVC, animated: true)
               
               
        
        
    }
    
 
    
   func  didSlectBazarCost(){
        
          let bazarCostVC = storyboard?.instantiateViewController(identifier: "BazarCostViewController") as! BazarCostViewController
             bazarCostVC.userEmail = self.userEmail
              self.navigationController?.pushViewController(bazarCostVC, animated: true)
                     
                     
        
    }
    
    func didSelectDailyMealCount(){
        
        let mealCountVC = storyboard?.instantiateViewController(identifier: "DailyMealCountViewController") as! DailyMealCountViewController
           mealCountVC.userEmail = self.userEmail
            self.navigationController?.pushViewController(mealCountVC, animated: true)
        
    }
    
    func didSelectCalculation(){
        
        let calculationVC = storyboard?.instantiateViewController(identifier: "CalculationViewController") as! CalculationViewController
        calculationVC.userEmail = self.userEmail
        self.navigationController?.pushViewController(calculationVC, animated: true)
    }
    
    
    
    
    
    
    func didSeletLogOut(){
    
       
        let alercontroller = UIAlertController(title: "Logout!!", message: "You want to logout?", preferredStyle: .actionSheet)
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alercontroller.addAction(cancel)
        
        let logout = UIAlertAction(title: "Logout", style: .destructive) { (action) in
            
            self.logout()
        }
        alercontroller.addAction(logout)
    
        self.present(alercontroller, animated: true, completion: nil)
        
        
      
        
       
    
           
       }
    
    
    func logout(){
        
             let firebaseAuth = Auth.auth()
           do {
               
             try firebaseAuth.signOut()
               
              navigationController?.popToRootViewController(animated: false)
               
           } catch let signOutError as NSError {
               
             print ("Error signing out: %@", signOutError)
               
           }
             
        
    }
    
    
    
    
    
    
}
