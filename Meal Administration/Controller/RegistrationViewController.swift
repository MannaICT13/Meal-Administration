//
//  RegistrationViewController.swift
//  Meal Administration
//
//  Created by Md Khaled Hasan Manna on 9/4/20.
//  Copyright © 2020 Md Khaled Hasan Manna. All rights reserved.
//

import UIKit

class RegistrationViewController: UIViewController {

    //MARK: - Properties
    
    @IBOutlet weak var messNameTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var rePasswordTextField: UITextField!
    
    
    @IBOutlet weak var registerBtnOutlet: UIButton!
    
    @IBOutlet weak var alreadyRegisterBtnOutlet: UIButton!
    
    
    //MARK: - init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        utilitiesManager()

    }
    
    
    //MARK: - Handler
    
    func utilitiesManager(){
        Utilities.assignBackgroundImage(img: "register.png", view:  view)
        Utilities.roundBtnFill(button: registerBtnOutlet)

        
    }
    
    
    @IBAction func registerBtnAction(_ sender: Any) {
    }
    
    
    @IBAction func alreadyRegisterBtnAction(_ sender: Any) {
    }
    

}
