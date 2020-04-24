//
//  ActivityIndicator.swift
//  Meal Administration
//
//  Created by Md Khaled Hasan Manna on 24/4/20.
//  Copyright © 2020 Md Khaled Hasan Manna. All rights reserved.
//

import Foundation
import UIKit


class ActivityIndicator{
    
    
    static func showActivityIndicator(uiView:UIView,targetVC: UIViewController){

       var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()

       activityIndicator = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
       activityIndicator.backgroundColor = Utilities.color
       activityIndicator.color = .white
       activityIndicator.layer.cornerRadius = 6
       activityIndicator.center = targetVC.view.center
       activityIndicator.hidesWhenStopped = true
       activityIndicator.style = .large
       activityIndicator.tag = 1
       uiView.addSubview(activityIndicator)
       activityIndicator.startAnimating()
        
      
        
        
    }
    
    static func hideActivityIndicator(uiView:UIView){
        
        let actInd :UIActivityIndicatorView = uiView.viewWithTag(1) as! UIActivityIndicatorView
        actInd.stopAnimating()
        actInd.removeFromSuperview()
    
        
        
        
    }
    
    
    
    
    
    
}
