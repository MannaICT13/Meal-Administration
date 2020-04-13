//
//  ContainerViewController.swift
//  Meal Administration
//
//  Created by Md Khaled Hasan Manna on 13/4/20.
//  Copyright © 2020 Md Khaled Hasan Manna. All rights reserved.
//

import UIKit

class ContainerViewController: UIViewController {

    
    //MARK: - Properties
    
    var homeController : HomeViewController!
    var centerController : UIViewController!
    var menuController : MenuViewController!
    
    var isExtended : Bool = false

    
    //MARK: - init
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
            
            view.insertSubview(menuController.view, at: 0)
            addChild(menuController)
            menuController.didMove(toParent: self)
            
            
            
        }
        
       
        
        
    }
    
    
    func animatePanel(extended : Bool){
        
         if extended{
                   
                   //Show manu
                   UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                       
                       self.centerController.view.frame.origin.x = self.centerController.view.frame.width - 80
                       
                       
                   }, completion: nil)
                   
                   
               }else{
                   //hide menu
                   UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                       
                       self.centerController.view.frame.origin.x = 0
                   }, completion: nil)
                   
                   
                   
                   
                   
               }
               
               
               
        
    }
    
    


}

extension ContainerViewController : HomeControllerDelegate{
  
    
    func handleToggle() {
    
        if !isExtended{
            
            menuConfiguration()
        }
        isExtended = !isExtended
        
        animatePanel(extended: isExtended)
        
        
        
    }
    
    
    
}
