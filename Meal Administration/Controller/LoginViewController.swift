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
    self.view.backgroundColor = UIColor.opaqueSeparator

        
        utilitieManager()
        setUpImageIcon()
      
    }
    
    //MARK: - Handler
    
    func utilitieManager(){
        
       
        // Utilities.assignBackgroundImage(img: "login.png", view: view)
         
         Utilities.roundBtnFill(button: loginBtnOutlet)
         Utilities.roundBtn(button: forgotPasswordBtnOutlet)
         Utilities.lineTextFieldStyle(textField: emailTextField)
         Utilities.lineTextFieldStyle(textField: passwordTextField)

        
    }
    
    func setUpImageIcon(){
      
        iconEmailImageView.image = UIImage(systemName: "envelope.fill")?.withRenderingMode(.alwaysOriginal).withTintColor(Utilities.color)
        iconPasswordImageView.image = UIImage(systemName: "lock.fill")?.withRenderingMode(.alwaysOriginal).withTintColor(Utilities.color)
        
        
        
    }
    
    @IBAction func loginBtnAction(_ sender: Any) {
    }
    
    
    @IBAction func forgotPasswordBtnAction(_ sender: Any) {
    }
    
    

}
