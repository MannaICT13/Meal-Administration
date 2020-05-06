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
    
    
    //to get Admin user email
    
    var userEmail = String()
    static let userEmailDefaults = UserDefaults.standard
    
    
    
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
        
        ActivityIndicator.showActivityIndicator(uiView: view, targetVC: self)
        login(email: email, password: password)
        
    }
    
    
    @IBAction func forgotPasswordBtnAction(_ sender: Any) {
        
        
        let alertController = UIAlertController(title: "Message!", message: "You want to reset password?", preferredStyle: .alert)
        
        
        alertController.addTextField { (emailTxt) in
            emailTxt.placeholder = "Email"
            emailTxt.borderStyle = .none
            emailTxt.keyboardType = .emailAddress
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(cancel)
        let send = UIAlertAction(title: "Send", style: .default) { (sendAction) in
            
            guard  let email = alertController.textFields![0].text else{return}
            
            self.forgotPassword(email: email)
            
            
        }
        alertController.addAction(send)
        alertController.view.tintColor = .black
        alertController.view.backgroundColor = Utilities.color
        self.present(alertController, animated: true, completion: nil)
        
    }
    
    

}



extension LoginViewController{
    
    
    
    private var authUser : User?{
        
        return Auth.auth().currentUser
    }
    
    func login(email:String,password:String){
    
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            
            if let err = error{
                
               // print(err.localizedDescription)
                ActivityIndicator.hideActivityIndicator(uiView: self.view)
                self.alertMessage(message: err.localizedDescription)
                
            }else{
                
                if result != nil && !self.authUser!.isEmailVerified{
                    
                   // print("Already send a verification link...")
                    self.alertMessage(message: "Already send a verification link.")
                    
                    
                }else{
                    
                    let containerVC = self.storyboard?.instantiateViewController(identifier: "ContainerViewController") as! ContainerViewController
                    self.navigationController?.pushViewController(containerVC, animated: true)
                 
                    containerVC.userEmail = (result?.user.email)!
                
                    ActivityIndicator.hideActivityIndicator(uiView: self.view)
                    
                    
                    
                }
               
                
                
            }
            
            
            
        }
    
        
        
        
    }
    
    
    func forgotPassword(email: String){
        
        
        Auth.auth().sendPasswordReset(withEmail: email) { (error) in
          
            if let err = error{
                
                //print(err.localizedDescription)
                self.alertMessage(message: err.localizedDescription)
                
            }else{
                
               // print("Successfully send a link to your email...")
                self.alertMessage(message: "Successfully send a link to your email.")
            }
            
        }
        
        
        
    }
    
    
    
    
    
    
    
}
extension LoginViewController{
    
    
    func alertMessage(message:String){
        
        let alertController = UIAlertController(title: "Error Message!", message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        
        alertController.addAction(ok)
        self.present(alertController, animated: true, completion: nil)
        
        
        
    }
    
    
    
    
    
    
    
    
}
