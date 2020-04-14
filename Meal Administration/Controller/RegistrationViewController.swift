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
    
    //textField properties
    @IBOutlet weak var messNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var rePasswordTextField: UITextField!
    
    //imageIcon properties
    
    @IBOutlet weak var iconMessNameImageView: UIImageView!
    @IBOutlet weak var iconEmailImageView: UIImageView!
    @IBOutlet weak var iconPasswordImageView: UIImageView!
    @IBOutlet weak var iconRePasswordImageView: UIImageView!
    
    
    //button  properties
    @IBOutlet weak var registerBtnOutlet: UIButton!
    @IBOutlet weak var alreadyRegisterBtnOutlet: UIButton!
    
    
    //MARK: - init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.opaqueSeparator
        
        
        utilitiesManager()
        setUpImageIcon()
        
    }
    
    
    //MARK: - Handler
    
    func utilitiesManager(){
        
       
        
       // Utilities.assignBackgroundImage(img: "register.png", view:  view)
        Utilities.roundBtnFill(button: registerBtnOutlet, color: Utilities.color)
        Utilities.lineTextFieldStyle(textField: messNameTextField)
        Utilities.lineTextFieldStyle(textField: emailTextField)
        Utilities.lineTextFieldStyle(textField: passwordTextField)
        Utilities.lineTextFieldStyle(textField: rePasswordTextField)
        
        alreadyRegisterBtnOutlet.tintColor = Utilities.color

        
    }
    
    func setUpImageIcon(){
        
        let color = Utilities.color
        
        iconMessNameImageView.image = UIImage(systemName: "house.fill")?.withRenderingMode(.alwaysOriginal).withTintColor(color)
        iconEmailImageView.image = UIImage(systemName: "envelope.fill")?.withRenderingMode(.alwaysOriginal).withTintColor(color)
        iconPasswordImageView.image = UIImage(systemName: "lock.fill")?.withRenderingMode(.alwaysOriginal).withTintColor(color)
        iconRePasswordImageView.image = UIImage(systemName: "lock.fill")?.withRenderingMode(.alwaysOriginal).withTintColor(color)
        
        
    }
    
    
    @IBAction func registerBtnAction(_ sender: Any) {
    }
    
    
    @IBAction func alreadyRegisterBtnAction(_ sender: Any) {
    }
    

}
