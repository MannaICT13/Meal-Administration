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
        case .calculation:
            return "Calculation"
        case .logout:
            return "Logout"
            
        }
    }
    var iconDescription : UIImage{
    
        switch self{
        case .members:
            return  UIImage(systemName: "person.2.fill") ?? UIImage()
        case .bazarSchedule:
            return UIImage(systemName: "timer") ?? UIImage()
        case .bazarCost:
             return UIImage(systemName: "dollarsign.circle.fill") ?? UIImage()
        case .calculation:
            return  UIImage(systemName: "pencil.and.ellipsis.rectangle") ?? UIImage()
        case .logout:
            return  UIImage(systemName: "goforward") ?? UIImage()
        
        }
    }
    
}
