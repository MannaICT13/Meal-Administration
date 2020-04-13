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
        
       // view.backgroundColor = .darkGray
        navBarConfiguration()

       /* Utilities.assignBackgroundImage(img: "logo2.png", view: view)
        self.navigationItem.hidesBackButton = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(logOut(_ :)))
 */
        
    }
    
    //MARK: - Handler
    
 /*   @objc func logOut(_ sender : UIBarButtonItem){

        navigationController?.popToRootViewController(animated: true)
        
    }
 */
    @objc func handleToggle(_ sender: UIBarButtonItem){
    print("hello World!!")
        
    }
    
    func navBarConfiguration(){
        
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.barTintColor = .darkGray
        navigationController?.navigationBar.barStyle = .black
        
       navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "line.horizontal.3")?.withRenderingMode(.alwaysOriginal).withTintColor(.white), style: .plain, target: self, action: #selector(handleToggle(_ :)))
        
        
        
    }
    
    
    
    

   

}
