//
//  AddMembersViewController.swift
//  Meal Administration
//
//  Created by Md Khaled Hasan Manna on 14/4/20.
//  Copyright © 2020 Md Khaled Hasan Manna. All rights reserved.
//

import UIKit

class AddMembersViewController: UIViewController {

    //MARK: - Properties
    
    // textField Outlets
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var rentTextField: UITextField!
    @IBOutlet weak var netTextField: UITextField!
    @IBOutlet weak var gassTextField: UITextField!
    @IBOutlet weak var khalaTextField: UITextField!
    @IBOutlet weak var currentTextField: UITextField!
    @IBOutlet weak var waterTextField: UITextField!
    @IBOutlet weak var othersTextField: UITextField!
    
    // Button Outlets
    @IBOutlet weak var saveBtnOutlets: UIButton!
    
    //icon Image Outlets
    @IBOutlet weak var nameImg: UIImageView!
    @IBOutlet weak var phoneImg: UIImageView!
    @IBOutlet weak var addressImg: UIImageView!
    @IBOutlet weak var emailImg: UIImageView!
    @IBOutlet weak var rentImg: UIImageView!
    @IBOutlet weak var netImg: UIImageView!
    @IBOutlet weak var gassImg: UIImageView!
    @IBOutlet weak var khalaImg: UIImageView!
    @IBOutlet weak var currentImg: UIImageView!
    @IBOutlet weak var waterImg: UIImageView!
    @IBOutlet weak var othersImg: UIImageView!
    

    var validation = TextFieldValidation()
    
    var userEmail = String()
    
    var isUpdate : Bool = false
   
   // var memberDetails : Member?
    var member = [Member]()
   
  
    var memberDetails : Member?
    var uid = String()
      
    
    //MARK: - init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        if isUpdate{
            
            saveBtnOutlets.setTitle("Update", for: .normal)
            
        }else{
            
            saveBtnOutlets.setTitle("Save", for: .normal)
            
        }
      
     
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        loadMemberDetails()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        setUpIconImg()
        utlilitieManager()
    
       
    }
    
    func loadMemberDetails(){
        
        if isUpdate{
            
            
            nameTextField.text = memberDetails?.name
            phoneTextField.text = String(memberDetails!.phone)
            addressTextField.text = memberDetails?.address
            emailTextField.text = memberDetails?.email
            rentTextField.text = String(memberDetails!.rent)
            netTextField.text = String(memberDetails!.net)
            gassTextField.text = String(memberDetails!.gass)
            khalaTextField.text = String(memberDetails!.khala)
            currentTextField.text = String(memberDetails!.current)
            waterTextField.text = String(memberDetails!.water)
            othersTextField.text = String(memberDetails!.others)
            uid = memberDetails!.id
            
            
            
        }
        
}
    
    
    
    
    //MARK: - Handler
    
    @IBAction func saveBtnAction(_ sender: Any) {
        
         guard let name  = nameTextField.text else { return}
         guard let phone  =  Int(phoneTextField.text!) else { return}
         guard let address  =  addressTextField.text else { return}
         guard let email  =  emailTextField.text else { return}
         guard let rent  =  Int(rentTextField.text!) else { return}
         guard let net  =  Int(netTextField.text!) else { return}
         guard let gass  =  Int(gassTextField.text!) else { return}
         guard let khala  =  Int(khalaTextField.text!) else { return}
         guard let current =  Int(currentTextField.text!) else { return}
         guard let water  =  Int(waterTextField.text!) else { return}
         guard let others  =  Int(othersTextField.text!) else { return}
        
        
    
     
        if self.validation.nameValidation(nameTextField.text!) == false {
          print("Invalid Name!")
            self.showAlert(message: "Invalid Name!")
            return
        }
       else if self.validation.phoneValidation(phoneTextField.text!) == false{
            print("Invalide Phone Number!")
            self.showAlert(message: "Invalide Phone Number!")
             return
            
        }

       else if self.validation.addressValidation(addressTextField.text!) == false {
            print("Invalide Address!")
            self.showAlert(message: "Invalide Address!")
             return
            
        }
  
        else if self.validation.emailValidation(emailTextField.text!) == false{
            print("Invalide Email!")
            self.showAlert(message: "Invalide Email!")
             return
            
        }
  
       else if  self.validation.costValidation(rentTextField.text!) == false{
            print("Invalide Rent Cost!")
            self.showAlert(message: "Invalide Rent Cost!")
             return
            
        }

        else if self.validation.costValidation(netTextField.text!) == false{
                   print("Invalide Net Cost!")
            self.showAlert(message: "Invalide Net Cost!")
             return
            
        }
        
        else if self.validation.costValidation(gassTextField.text!) == false{
              print("Invalide Gass Amount!")
            self.showAlert(message: "Invalide Gass Amount!")
             return
            
        }
        
        else if self.validation.costValidation(khalaTextField.text!) == false{
              print("Invalide Khala Cost!")
            self.showAlert(message: "Invalide Khala Cost!")
             return        }
  
        
      else  if self.validation.costValidation(currentTextField.text!) == false{
              print("Invalide Current Cost!")
            self.showAlert(message: "Invalide Current Cost!")
             return        }
        
       
       else if self.validation.costValidation(waterTextField.text!) == false{
              print("Invalide Water Cost!")
            self.showAlert(message: "Invalide Water Cost!")
             return        }
        
    
        else if self.validation.costValidation(othersTextField.text!) == false{
              print("Invalide Others Cost!")
            self.showAlert(message: "Invalide Others Cost!")
             return
            
        }
        
     else{
            
       if isUpdate{
            
            MemberDbHelper.instanceMemberDb.updateMember(userEmail:userEmail, name: name, phone: phone, address: address, email: email, rent: rent, net: net, gass: gass, khala: khala, current: current, water: water, others: others,id:uid)
            
          
            self.navigationController?.popViewController(animated: true)
          
               
            
        }else{
            
        MemberDbHelper.instanceMemberDb.writeMember(userEmail:userEmail, name: name, phone: phone, address: address, email: email, rent: rent, net: net, gass: gass, khala: khala, current: current, water: water, others: others)
            self.navigationController?.popViewController(animated: true)
        
        }
            
  }
        
    }
    
    func setUpIconImg(){
        
        nameImg.image = UIImage(systemName: "person.fill")?.withRenderingMode(.alwaysOriginal).withTintColor(Utilities.color)
         phoneImg.image = UIImage(systemName: "phone.fill")?.withRenderingMode(.alwaysOriginal).withTintColor(Utilities.color)
         addressImg.image = UIImage(systemName: "house.fill")?.withRenderingMode(.alwaysOriginal).withTintColor(Utilities.color)
         emailImg.image = UIImage(systemName: "envelope.fill")?.withRenderingMode(.alwaysOriginal).withTintColor(Utilities.color)
         rentImg.image = UIImage(systemName: "dollarsign.circle.fill")?.withRenderingMode(.alwaysOriginal).withTintColor(Utilities.color)
         netImg.image = UIImage(systemName: "dollarsign.circle.fill")?.withRenderingMode(.alwaysOriginal).withTintColor(Utilities.color)
         gassImg.image = UIImage(systemName: "dollarsign.circle.fill")?.withRenderingMode(.alwaysOriginal).withTintColor(Utilities.color)
         khalaImg.image = UIImage(systemName: "dollarsign.circle.fill")?.withRenderingMode(.alwaysOriginal).withTintColor(Utilities.color)
         currentImg.image = UIImage(systemName: "dollarsign.circle.fill")?.withRenderingMode(.alwaysOriginal).withTintColor(Utilities.color)
         waterImg.image = UIImage(systemName: "dollarsign.circle.fill")?.withRenderingMode(.alwaysOriginal).withTintColor(Utilities.color)
         othersImg.image = UIImage(systemName: "dollarsign.circle.fill")?.withRenderingMode(.alwaysOriginal).withTintColor(Utilities.color)
        
        
        
    }
    
    
    func utlilitieManager(){
        
         Utilities.roundBtnFill(button: saveBtnOutlets, color: Utilities.color)
         Utilities.lineTextFieldStyle(textField: nameTextField)
         Utilities.lineTextFieldStyle(textField: phoneTextField)
         Utilities.lineTextFieldStyle(textField: addressTextField)
         Utilities.lineTextFieldStyle(textField: emailTextField)
         Utilities.lineTextFieldStyle(textField:  rentTextField)
         Utilities.lineTextFieldStyle(textField: netTextField)
         Utilities.lineTextFieldStyle(textField: gassTextField)
         Utilities.lineTextFieldStyle(textField: khalaTextField)
         Utilities.lineTextFieldStyle(textField: currentTextField)
         Utilities.lineTextFieldStyle(textField: waterTextField)
         Utilities.lineTextFieldStyle(textField: othersTextField)
       
        
    }
    
    
    


}

extension AddMembersViewController{
    
    
    func showAlert(message:String){
        
        
        let alert = UIAlertController(title: "Error Message!", message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(ok)
        
        self.present(alert, animated: true, completion: nil)
        
        
    }
    
    
}
