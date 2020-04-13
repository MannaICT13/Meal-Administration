//
//  LoginViewController.swift
//  Meal Administration
//
//  Created by Md Khaled Hasan Manna on 9/4/20.
//  Copyright © 2020 Md Khaled Hasan Manna. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    
    //MARK: - Properties
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var iconEmailImageView: UIImageView!
    @IBOutlet weak var iconPasswordImageView: UIImageView!
    
    @IBOutlet weak var loginBtnOutlet: UIButton!
    @IBOutlet weak var forgotPasswordBtnOutlet: UIButton!
    
    
    
    
    
    
    //MARK: - init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        utilitieManager()
        setUpImageIcon()
      
    }
    
    //MARK: - Handler
    
    func utilitieManager(){
        
        
         Utilities.assignBackgroundImage(img: "login.png", view: view)
         Utilities.roundBtnFill(button: loginBtnOutlet)
         Utilities.roundBtn(button: forgotPasswordBtnOutlet)
         Utilities.lineTextFieldStyle(textField: emailTextField)
         Utilities.lineTextFieldStyle(textField: passwordTextField)

        
    }
    
    func setUpImageIcon(){
        
        let color : UIColor =  UIColor(red: 112.0/255.0, green: 86.0/255.0, blue: 164.0/255.0, alpha: 1.0)
        iconEmailImageView.image = UIImage(systemName: "envelope.fill")?.withRenderingMode(.alwaysOriginal).withTintColor(color)
        iconPasswordImageView.image = UIImage(systemName: "lock.fill")?.withRenderingMode(.alwaysOriginal).withTintColor(color)
        
        
        
    }
    
    @IBAction func loginBtnAction(_ sender: Any) {
    }
    
    
    @IBAction func forgotPasswordBtnAction(_ sender: Any) {
    }
    
    

}
