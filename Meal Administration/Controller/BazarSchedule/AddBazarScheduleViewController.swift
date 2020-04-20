//
//  AddBazarScheduleViewController.swift
//  Meal Administration
//
//  Created by Md Khaled Hasan Manna on 14/4/20.
//  Copyright © 2020 Md Khaled Hasan Manna. All rights reserved.
//

import UIKit

class AddBazarScheduleViewController: UIViewController {

    //MARK: - Properties
    
    //text fields outlets
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var startDateTextField: UITextField!
    @IBOutlet weak var endDateTextField: UITextField!
    
    //icon image outlets
    @IBOutlet weak var nameImg: UIImageView!
    @IBOutlet weak var emailImg: UIImageView!
    @IBOutlet weak var startDateImg: UIImageView!
    @IBOutlet weak var endDateImg: UIImageView!
    
    //button outlets
    @IBOutlet weak var saveBtnOutlet: UIButton!
    
    
    
    var datePicker : UIDatePicker!
    var pickerView : UIPickerView!
    
    var userEmail = String()
    var member = [Member]()

    
    //MARK: - init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpIconImage()
        utilitieManager()
        manageDatePicker()
        managePickerView()
        
        MemberDbHelper.instanceMemberDb.readMember(userEmail:userEmail ) { (member) in
            self.member = member
        }
        

    }
    override func viewWillAppear(_ animated: Bool) {
        
        MemberDbHelper.instanceMemberDb.readMember(userEmail:userEmail ) { (member) in
            self.member = member
        }
        
        
    }

    
    //MARK: - Handler
    

    @IBAction func saveBtnAction(_ sender: Any) {
        
    }
    
    
    func manageDatePicker(){
        
        datePicker = UIDatePicker()
        
        //create a toobar
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        let done = UIBarButtonItem(title: "Done", style: .done, target: nil, action: #selector(datePickerAction(_ :)))
        toolBar.setItems([done], animated: true)
        
                 startDateTextField.inputAccessoryView = toolBar
                 startDateTextField.inputView = datePicker
                 endDateTextField.inputAccessoryView = toolBar
                 endDateTextField.inputView = datePicker
            
    
        datePicker.datePickerMode = .date
                
    }
    

    @objc func datePickerAction(_ sender : UIBarButtonItem){
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        
        if startDateTextField.isFirstResponder {
            
            startDateTextField.text = dateFormatter.string(from: datePicker.date)
            
            
        }else if endDateTextField.isFirstResponder{
            
            endDateTextField.text = dateFormatter.string(from: datePicker.date)
        }
        

        self.view.endEditing(true)
        
        
        
    }
    
    
    
    
    
    
    func setUpIconImage(){
        
        nameImg.image = UIImage(systemName: "person.fill")?.withRenderingMode(.alwaysOriginal).withTintColor(Utilities.color)
        emailImg.image = UIImage(systemName: "envelope.fill")?.withRenderingMode(.alwaysOriginal).withTintColor(Utilities.color)
        startDateImg.image = UIImage(systemName: "clock.fill")?.withRenderingMode(.alwaysOriginal).withTintColor(Utilities.color)
        endDateImg.image = UIImage(systemName: "clock.fill")?.withRenderingMode(.alwaysOriginal).withTintColor(Utilities.color)

        
    }
    
    func utilitieManager(){
        
         Utilities.lineTextFieldStyle(textField: nameTextField)
         Utilities.lineTextFieldStyle(textField: emailTextField)
         Utilities.lineTextFieldStyle(textField: startDateTextField)
         Utilities.lineTextFieldStyle(textField: endDateTextField)
         Utilities.roundBtnFill(button: saveBtnOutlet, color: Utilities.color)
        
        
    }
    
    
    
    
    

}
extension AddBazarScheduleViewController:UIPickerViewDelegate,UIPickerViewDataSource{
   
    
    
    
    func managePickerView(){
        
        pickerView = UIPickerView()
        pickerView.delegate = self
        pickerView.dataSource = self
    
        //manage toolbar
       
            let toolBar = UIToolbar()
             toolBar.sizeToFit()
        
         let done = UIBarButtonItem(title: "Done", style: .done, target: self,action: #selector(action))
               toolBar.setItems([done], animated: true)
             //  toolBar.isUserInteractionEnabled = true
        
       
                 nameTextField.inputAccessoryView = toolBar
                 nameTextField.inputView = pickerView
                            
                 emailTextField.inputAccessoryView = toolBar
                 emailTextField.inputView = pickerView
     
             
        
    }

    @objc func action(){
        self.view.endEditing(true)
    }
    
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return member.count
        
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if nameTextField.isFirstResponder{
            
        return member[row].name
            
        }else if emailTextField.isFirstResponder{
            return member[row].email
            
        }
        return nil
        
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
       
        if nameTextField.isFirstResponder{
            
            let selectedName = member[row].name
            nameTextField.text = selectedName
            
        }else if emailTextField.isFirstResponder{
            
            let selectedEmail = member[row].email
            emailTextField.text = selectedEmail
        }
        
    }
    
    
    
    
    
}
