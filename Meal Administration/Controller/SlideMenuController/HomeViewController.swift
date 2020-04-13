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
    
    
    
    //MARK: - init
    
    override func viewDidLoad() {
        super.viewDidLoad()

        Utilities.assignBackgroundImage(img: "logo2.png", view: view)
        self.navigationItem.hidesBackButton = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(logOut(_ :)))
    }
    
    //MARK: - Handler
    
    @objc func logOut(_ sender : UIBarButtonItem){

        navigationController?.popToRootViewController(animated: true)
        
    }

   

}
