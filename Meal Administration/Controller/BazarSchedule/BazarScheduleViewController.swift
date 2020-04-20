//
//  BazarScheduleViewController.swift
//  Meal Administration
//
//  Created by Md Khaled Hasan Manna on 14/4/20.
//  Copyright © 2020 Md Khaled Hasan Manna. All rights reserved.
//

import UIKit

class BazarScheduleViewController: UIViewController {

    
    //MARK: - Properties
    var userEmail = String()
    
    
    //MARK: - init
    
    override func viewDidLoad() {
        super.viewDidLoad()

        addScheduleNavBarBtn()
    }
    
    //MARK: - Handler
    func addScheduleNavBarBtn(){
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add Schedule", style: .plain, target: self, action: #selector(addScheduleAction( _ :)))
        
        
    }
    
    
    @objc func addScheduleAction( _ sender : UIBarButtonItem){
        
        let addBazarScheduleVC = storyboard?.instantiateViewController(identifier: "AddBazarScheduleViewController") as! AddBazarScheduleViewController
        addBazarScheduleVC.userEmail = self.userEmail
        self.navigationController?.pushViewController(addBazarScheduleVC, animated: true)
        
    }
    

}
