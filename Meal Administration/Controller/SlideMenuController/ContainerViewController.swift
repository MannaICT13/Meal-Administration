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
        view.addSubview(centerController.view)
        addChild(centerController)
        centerController.didMove(toParent: self)
        
        
    }
    
    


}
