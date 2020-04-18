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
    

    
    var userEmail = String()
    
    var isUpdate : Bool = false
   
    var memberDetails : Member?
    var member = [Member]()
   
    
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
        super.viewWillAppear(true)
        
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
        
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        setUpIconImg()
        utlilitieManager()
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
        
        if isUpdate{
            
            MemberDbHelper.instanceMemberDb.updateMember(userEmail:userEmail, name: name, phone: phone, address: address, email: email, rent: rent, net: net, gass: gass, khala: khala, current: current, water: water, others: others,id: "uid")
            
        }else{
            
        MemberDbHelper.instanceMemberDb.writeMember(userEmail:userEmail, name: name, phone: phone, address: address, email: email, rent: rent, net: net, gass: gass, khala: khala, current: current, water: water, others: others)
        
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
