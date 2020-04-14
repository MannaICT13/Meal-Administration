//
//  Utilities.swift
//  Meal Administration
//
//  Created by Md Khaled Hasan Manna on 9/4/20.
//  Copyright © 2020 Md Khaled Hasan Manna. All rights reserved.
//

import Foundation
import UIKit

class Utilities {
    
    //MARK: - Handler
    
  /*  static func assignBackgroundImage(img : String,view : UIView){
        
        let backgroundImg = UIImage(named: img)?.withRenderingMode(.alwaysOriginal).withTintColor(.quaternaryLabel)
        var imageView : UIImageView!
        imageView = UIImageView(frame: view.bounds)
        imageView.image = backgroundImg
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true
        view.addSubview(imageView)
        view.sendSubviewToBack(imageView)
        
        
    }
   */
    
    // for coloring button/navigationbar/textfield
    static let color : UIColor =  UIColor(red: 112.0/255.0, green: 86.0/255.0, blue: 164.0/255.0, alpha: 1.0)
    
    
    static func roundBtnFill(button : UIButton,color : UIColor){
        
        button.backgroundColor = color
        button.clipsToBounds = true
        button.layer.cornerRadius = 20.0
        button.layer.borderWidth = 2.0
        button.layer.borderColor = UIColor.black.cgColor
        button.tintColor = .white
        button.titleLabel?.font = UIFont.systemFont(ofSize: 25)
        
      
        
    }
    
    static func roundBtn(button : UIButton){

               button.backgroundColor = .clear
               button.clipsToBounds = true
               button.layer.cornerRadius = 20.0
               button.layer.borderWidth = 5.0
               button.layer.borderColor = CGColor(srgbRed: 112.0/255.0, green: 86.0/255.0, blue: 164.0/255.0, alpha: 1.0)
               button.tintColor = color
               button.titleLabel?.font = UIFont.systemFont(ofSize: 25)
             
        
    }
    
    static func lineTextFieldStyle(textField: UITextField){
        
        
        let bottomLine = CALayer()
        
        bottomLine.frame = CGRect(x: 0, y: textField.frame.height - 3, width: textField.frame.width, height: 3)
        bottomLine.backgroundColor = CGColor(srgbRed: 112.0/255.0, green: 86.0/255.0, blue: 164.0/255.0, alpha: 1.0)
       
        textField.borderStyle = .none
        textField.layer.addSublayer(bottomLine)
        
        
        
    }
    
    
    
    
    
    
}
