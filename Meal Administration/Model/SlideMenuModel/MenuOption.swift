//
//  MenuOption.swift
//  Meal Administration
//
//  Created by Md Khaled Hasan Manna on 13/4/20.
//  Copyright © 2020 Md Khaled Hasan Manna. All rights reserved.
//

import Foundation
import UIKit
enum MenuOption : Int,CustomStringConvertible {
  
    
    case members
    case bazarSchedule
    case bazarCost
    case dailyMealCount
    case calculation
    case logout
    
    
    var description : String{
        
        switch self {
        case .members:
            return "Members"
        case .bazarSchedule:
            return "Bazar Schedule"
        case .bazarCost:
            return "Bazar Cost"
        case .dailyMealCount:
            return "Daily Meal Count"
        case .calculation:
            return "Calculation"
        case .logout:
           return "Logout"
            
        }
    }
    
    var iconDescription : UIImage{
    
        switch self{
            
        case .members:
            return  UIImage(systemName: "person.2.fill")?.withRenderingMode(.alwaysOriginal).withTintColor(.white) ?? UIImage()
        case .bazarSchedule:
            return UIImage(systemName: "timer")?.withRenderingMode(.alwaysOriginal).withTintColor(.white) ?? UIImage()
        case .bazarCost:
             return UIImage(systemName: "dollarsign.circle.fill")?.withRenderingMode(.alwaysOriginal).withTintColor(.white) ?? UIImage()
            
        case .dailyMealCount:
                        return UIImage(systemName: "list.number")?.withRenderingMode(.alwaysOriginal).withTintColor(.white) ?? UIImage()
            
        case .calculation:
            return  UIImage(systemName: "pencil.and.ellipsis.rectangle")?.withRenderingMode(.alwaysOriginal).withTintColor(.white) ?? UIImage()
        case .logout:
            return  UIImage(systemName: "goforward")?.withRenderingMode(.alwaysOriginal).withTintColor(.white) ?? UIImage()
        
        }
    }
    
}
