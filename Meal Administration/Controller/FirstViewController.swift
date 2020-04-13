//
//  FirstViewController.swift
//  Meal Administration
//
//  Created by Md Khaled Hasan Manna on 9/4/20.
//  Copyright © 2020 Md Khaled Hasan Manna. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    //MARK: - Properties
    
    @IBOutlet weak var loginBtnOutlet: UIButton!
    @IBOutlet weak var registerBtnOutlet: UIButton!
    
    
    //MARK: - init
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        utilitieManager()
    }
    
    //MARK: - Handler
    
    
    func utilitieManager(){
        
             Utilities.assignBackgroundImage(img: "background.png", view: view)
             Utilities.roundBtnFill(button: loginBtnOutlet)
             Utilities.roundBtn(button: registerBtnOutlet)
          
        
        
        
    }
    
    @IBAction func loginBtnAction(_ sender: Any) {
    }
    
    
    @IBAction func registerBtnAction(_ sender: Any) {
    }
    
    
    
 
}
