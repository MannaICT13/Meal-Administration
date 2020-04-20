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
   
    @IBOutlet weak var nameImg: UIImageView!
    @IBOutlet weak var emailImg: UIImageView!
    @IBOutlet weak var mealNumberImg: UIImageView!
    @IBOutlet weak var dateImg: UIImageView!
    
    
    @IBOutlet weak var submitBtnOutlets: UIButton!
    
    //MARK: - init
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    
    //MARK: - Handler
    
    
    @IBAction func submitBtnAction(_ sender: Any) {
    }
    
    


}
