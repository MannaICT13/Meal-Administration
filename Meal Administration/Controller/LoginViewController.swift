//
//  LoginViewController.swift
//  Meal Administration
//
//  Created by Md Khaled Hasan Manna on 9/4/20.
//  Copyright © 2020 Md Khaled Hasan Manna. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

      //  assignBackground()
    }
    
    
    func assignBackground(){
        
        let background = UIImage(named: "logo1.png")
        var imageView : UIImageView!
        imageView = UIImageView(frame: view.bounds)
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = background
        imageView.center = view.center
        self.view.addSubview(imageView)
        self.view.sendSubviewToBack(imageView)
        
    }
    

}
