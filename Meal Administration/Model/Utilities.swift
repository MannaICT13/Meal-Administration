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
    
    static func assignBackgroundImage(img : String,view : UIView){
        
        let backgroundImg = UIImage(named: img)
        var imageView : UIImageView!
        imageView = UIImageView(frame: view.bounds)
        imageView.image = backgroundImg
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true
        view.addSubview(imageView)
        view.sendSubviewToBack(imageView)
        
        
    }
    
    
    
    
    
    
}
