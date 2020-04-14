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
    
    
    @IBOutlet weak var saveBtnOutlet: UIButton!
    
    
    
    var datePicker : UIDatePicker!
    
    //MARK: - init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpIconImage()
        utilitieManager()
        manageDatePicker()

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
