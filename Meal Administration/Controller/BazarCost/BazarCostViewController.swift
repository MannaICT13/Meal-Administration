//
//  BazarCostViewController.swift
//  Meal Administration
//
//  Created by Md Khaled Hasan Manna on 15/4/20.
//  Copyright © 2020 Md Khaled Hasan Manna. All rights reserved.
//

import UIKit

class BazarCostViewController: UIViewController {

    
    //MARK: - Properties
    
    
    //MARK: - init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addCostNavBarBtn()
        
    }
    
    
    //MARK: - Handler
    
    func addCostNavBarBtn(){
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add Cost", style: .plain, target: self, action: #selector(addCostAction(_: )))
        
        
    }
    
    @objc func addCostAction(_ sender : UIBarButtonItem){
        
        let addBazarCostVC = storyboard?.instantiateViewController(identifier: "BazarCostViewController") as! BazarCostViewController
        self.navigationController?.pushViewController(addBazarCostVC, animated: true)
        
        
        
    }
    


}
