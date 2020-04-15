//
//  LoginViewController.swift
//  Meal Administration
//
//  Created by Md Khaled Hasan Manna on 9/4/20.
//  Copyright © 2020 Md Khaled Hasan Manna. All rights reserved.
//

import UIKit
import FirebaseAuth
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
        
       
        // Utilities.assignBackgroundImage(img: "login.png", view: view)
         
        Utilities.roundBtnFill(button: loginBtnOutlet, color: Utilities.color)
         Utilities.roundBtn(button: forgotPasswordBtnOutlet)
         Utilities.lineTextFieldStyle(textField: emailTextField)
         Utilities.lineTextFieldStyle(textField: passwordTextField)

        
    }
    
    func setUpImageIcon(){
      
        iconEmailImageView.image = UIImage(systemName: "envelope.fill")?.withRenderingMode(.alwaysOriginal).withTintColor(Utilities.color)
        iconPasswordImageView.image = UIImage(systemName: "lock.fill")?.withRenderingMode(.alwaysOriginal).withTintColor(Utilities.color)
        
        
        
    }
    
    @IBAction func loginBtnAction(_ sender: Any) {
        
        
        guard let email = emailTextField.text else{return}
        guard let password = passwordTextField.text else {return}
        
     
        login(email: email, password: password)
    }
    
    
    @IBAction func forgotPasswordBtnAction(_ sender: Any) {
    }
    
    

}



extension LoginViewController{
    
    
    
    private var authUser : User?{
        
        return Auth.auth().currentUser
    }
    
    func login(email:String,password:String){
        
        
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            
            if let err = error{
                
                print(err.localizedDescription)
            }else{
                
                if result != nil && !self.authUser!.isEmailVerified{
                    
                    print("Already send a verification link...")
                    
                    
                }else{
                    
                    let containerVC = self.storyboard?.instantiateViewController(identifier: "ContainerViewController") as! ContainerViewController
                    self.navigationController?.pushViewController(containerVC, animated: true)
                    
                    
                }
                
                
            }
            
            
            
        }
        
        
        
        
    }
    
    
    
    
    
    
    
    
}
