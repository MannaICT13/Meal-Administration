//
//  HomeViewController.swift
//  Meal Administration
//
//  Created by Md Khaled Hasan Manna on 13/4/20.
//  Copyright © 2020 Md Khaled Hasan Manna. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    //MARK: - Properties
    
    var delegate : HomeControllerDelegate!
    
    
    //MARK: - init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        navBarConfiguration()

       // self.navigationItem.hidesBackButton = true
        
    }
    
    //MARK: - Handler
    
    @objc func handleToggle(_ sender: UIBarButtonItem){
        
        delegate.handleToggle(menuOption: nil)
        
    }
    
    
    
    //added a navigationbar with left button
    
    func navBarConfiguration(){
        
        let navBar = navigationController?.navigationBar
        navBar?.barTintColor = Utilities.color
        navBar?.tintColor = .white
        navBar?.isTranslucent = false
        navBar?.titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
      
       navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "line.horizontal.3")?.withRenderingMode(.alwaysOriginal).withTintColor(.white), style: .plain, target: self, action: #selector(handleToggle(_ :)))
        
        
        
    }
    
    
    
    

   

}
