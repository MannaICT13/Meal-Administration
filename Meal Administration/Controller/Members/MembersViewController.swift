//
//  MembersViewController.swift
//  Meal Administration
//
//  Created by Md Khaled Hasan Manna on 14/4/20.
//  Copyright © 2020 Md Khaled Hasan Manna. All rights reserved.
//

import UIKit

class MembersViewController: UIViewController {

    
    //MARK: - Properties
    
    
    //MARK: - init
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .opaqueSeparator
        addMembersNavBarBtn()
    }
    
    //MARK: - Handler
    
    func addMembersNavBarBtn(){
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add Members", style: .plain, target: self, action: #selector(addNavBtnAction(_ :)))
        
        
    }
    
    @objc func addNavBtnAction(_ sender : UIBarButtonItem){
        
        let addMembersVC = storyboard?.instantiateViewController(identifier: "AddMembersViewController") as! AddMembersViewController
        self.navigationController?.pushViewController(addMembersVC, animated: true)
        
        
    }
    

   

}
