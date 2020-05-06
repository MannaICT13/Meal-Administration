//
//  RegistrationViewController.swift
//  Meal Administration
//
//  Created by Md Khaled Hasan Manna on 9/4/20.
//  Copyright © 2020 Md Khaled Hasan Manna. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

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
    
    let db = Firestore.firestore()
    var validation = TextFieldValidation()
    //MARK: - init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
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
    
        guard let email = emailTextField.text else {return}
        guard  let password = passwordTextField.text else {return}
        guard let rePassword = rePasswordTextField.text else {return}
        guard let messName = messNameTextField.text else{return}
      
        self.registration(messName: messName, email: email, password: password, rePassword: rePassword)
            
        
    }
    
    
    @IBAction func alreadyRegisterBtnAction(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
        
        
        
    }
    

}



extension RegistrationViewController {
    
    
    
    //User Registration
    
    private var authUser : User?{
        return Auth.auth().currentUser
        
    }
    
    
    //for email Link Verification
    
    func emailVerfication(){
        
        if authUser != nil && !self.authUser!.isEmailVerified{
            
            authUser?.sendEmailVerification(completion: { (error) in
                
                if let err = error{
                    
                    print(err.localizedDescription)
                    self.alertMessage(message: err.localizedDescription)
                }else{
                    
                   // print("Successfully send verification link.....")
                    self.alertMessage(message: "Successfully send verification link.")
                }
                
            })
            
        }
        
        
        
    }
    
    
    //User registration
     
    func registration(messName: String,email:String,password:String,rePassword:String){
      
        
        if password != rePassword{
           // print("Password Not Match")
            self.alertMessage(message: "Password Not Match!")
        }
        else{
            
            Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
                
                if let err = error{
                    
                    print(err.localizedDescription)
                    self.alertMessage(message: "Error in creating user!")
                    
                    return
                }else{
                    
                   
                    
                    self.db.collection(email).addDocument(data: [
                        "messName": messName,
                        "email":email,
                        "password":password,
                        "uid":result!.user.uid
                    
                    
                    ]) { (error) in
                        
                        if let err = error{
                            
                            print(err.localizedDescription)
                            self.alertMessage(message: "Error in creating user!")
                            return
                        }
                        
                        
                    }
                    self.emailVerfication()
                    
                }
                
                
                
            }
            
            
            
        }
     
        
        
    }
    
    
    
    
    
}
extension RegistrationViewController{
    
      func alertMessage(message:String){
          
          let alertController = UIAlertController(title: "Error Message!", message: message, preferredStyle: .alert)
          let ok = UIAlertAction(title: "OK", style: .cancel, handler: nil)
          
          alertController.addAction(ok)
          self.present(alertController, animated: true, completion: nil)
          
          
          
      }
      
    
    
}
