//
//  DailyMealCountViewController.swift
//  Meal Administration
//
//  Created by Md Khaled Hasan Manna on 15/4/20.
//  Copyright © 2020 Md Khaled Hasan Manna. All rights reserved.
//

import UIKit

class DailyMealCountViewController: UIViewController {

    //MARK: - Properties
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var mealNumberTextField: UITextField!
    @IBOutlet weak var dateTextField: UITextField!
    
    @IBOutlet weak var nameImg: UIImageView!
    @IBOutlet weak var emailImg: UIImageView!
    @IBOutlet weak var mealNumberImg: UIImageView!
    @IBOutlet weak var dateImg: UIImageView!
    
    
    @IBOutlet weak var submitBtnOutlets: UIButton!
    
    @IBOutlet weak var subView: UIView!
    //MARK: - init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(subView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
         mangeIcon()
         utilitiManager()
    }
    //MARK: - Handler
    
    
    @IBAction func submitBtnAction(_ sender: Any) {
        
        
    }
    
    func mangeIcon(){
        
        nameImg.image = UIImage(systemName: "person.fill")?.withRenderingMode(.alwaysOriginal).withTintColor(Utilities.color)
        emailImg.image = UIImage(systemName: "envelope.fill")?.withRenderingMode(.alwaysOriginal).withTintColor(Utilities.color)
        mealNumberImg.image = UIImage(systemName: "list.number")?.withRenderingMode(.alwaysOriginal).withTintColor(Utilities.color)
        dateImg.image = UIImage(systemName: "clock.fill")?.withRenderingMode(.alwaysOriginal).withTintColor(Utilities.color)
        
    }
    func utilitiManager(){
        
        Utilities.roundBtnFill(button: submitBtnOutlets, color: Utilities.color)
        Utilities.lineTextFieldStyle(textField: nameTextField)
        Utilities.lineTextFieldStyle(textField: emailTextField)
        Utilities.lineTextFieldStyle(textField: mealNumberTextField)
        Utilities.lineTextFieldStyle(textField: dateTextField)
        
        
    }
    
    
    
    


}
