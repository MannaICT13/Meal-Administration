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
    

    
    
    
    //MARK: - init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .opaqueSeparator
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.view.backgroundColor = Utilities.color
        setUpIconImg()
        utlilitieManager()
    }
    
    
    
    
    //MARK: - Handler
    
    @IBAction func saveBtnAction(_ sender: Any) {
        
        
    }
    
    func setUpIconImg(){
        
        nameImg.image = UIImage(systemName: "person.fill")?.withRenderingMode(.alwaysOriginal).withTintColor(.white)
         phoneImg.image = UIImage(systemName: "phone.fill")?.withRenderingMode(.alwaysOriginal).withTintColor(.white)
         addressImg.image = UIImage(systemName: "house.fill")?.withRenderingMode(.alwaysOriginal).withTintColor(.white)
         emailImg.image = UIImage(systemName: "envelope.fill")?.withRenderingMode(.alwaysOriginal).withTintColor(.white)
         rentImg.image = UIImage(systemName: "dollarsign.circle.fill")?.withRenderingMode(.alwaysOriginal).withTintColor(.white)
         netImg.image = UIImage(systemName: "dollarsign.circle.fill")?.withRenderingMode(.alwaysOriginal).withTintColor(.white)
         gassImg.image = UIImage(systemName: "dollarsign.circle.fill")?.withRenderingMode(.alwaysOriginal).withTintColor(.white)
         khalaImg.image = UIImage(systemName: "dollarsign.circle.fill")?.withRenderingMode(.alwaysOriginal).withTintColor(.white)
         currentImg.image = UIImage(systemName: "dollarsign.circle.fill")?.withRenderingMode(.alwaysOriginal).withTintColor(.white)
         waterImg.image = UIImage(systemName: "dollarsign.circle.fill")?.withRenderingMode(.alwaysOriginal).withTintColor(.white)
         othersImg.image = UIImage(systemName: "dollarsign.circle.fill")?.withRenderingMode(.alwaysOriginal).withTintColor(.white)
        
        
        
    }
    
    
    func utlilitieManager(){
        
        Utilities.roundBtnFill(button: saveBtnOutlets, color: .white)
    
        
        
    }
    
    
    


}
