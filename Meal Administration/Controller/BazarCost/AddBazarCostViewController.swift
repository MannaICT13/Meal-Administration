//
//  AddBazarCostViewController.swift
//  Meal Administration
//
//  Created by Md Khaled Hasan Manna on 15/4/20.
//  Copyright © 2020 Md Khaled Hasan Manna. All rights reserved.
//

import UIKit

class AddBazarCostViewController: UIViewController {

    
    //MARK: - Properties
    
    //textfield outlets
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var bazarCostTextField: UITextField!
    @IBOutlet weak var bazarDateTextField: UITextField!
    
    //icon image outlets
    
    @IBOutlet weak var nameImg: UIImageView!
    @IBOutlet weak var emailImg: UIImageView!
    @IBOutlet weak var bazarCostImg: UIImageView!
    @IBOutlet weak var bazarDateImg: UIImageView!
    
    
    @IBOutlet weak var saveBtnOutlet: UIButton!
    
    
    //MARK: - init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        utilitieManager()
        setUpImageIcon()

      
    }
    
    //MARK: - Hanler
    

   
    @IBAction func saveBtnAction(_ sender: Any) {
        
    }
    
    
    
    
    func setUpImageIcon(){
        
        nameImg.image = UIImage(systemName: "person.fill")?.withRenderingMode(.alwaysOriginal).withTintColor(Utilities.color)
        
        emailImg.image = UIImage(systemName: "envelope.fill")?.withRenderingMode(.alwaysOriginal).withTintColor(Utilities.color)
        
        bazarCostImg.image = UIImage(systemName: "dollarsign.circle.fill")?.withRenderingMode(.alwaysOriginal).withTintColor(Utilities.color)
        
        bazarDateImg.image = UIImage(systemName: "clock.fill")?.withRenderingMode(.alwaysOriginal).withTintColor(Utilities.color)
        
        
        
        
    }
    func utilitieManager(){
        
           Utilities.lineTextFieldStyle(textField: nameTextField)
           Utilities.lineTextFieldStyle(textField: emailTextField)
           Utilities.lineTextFieldStyle(textField: bazarCostTextField)
           Utilities.lineTextFieldStyle(textField: bazarDateTextField)
        
        Utilities.roundBtnFill(button: saveBtnOutlet, color: Utilities.color)
        
        
    }
    
}
