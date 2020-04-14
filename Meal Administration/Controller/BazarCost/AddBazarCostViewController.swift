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

      
    }
    
    //MARK: - Hanler
    

   
    @IBAction func saveBtnAction(_ sender: Any) {
    }
    
}
