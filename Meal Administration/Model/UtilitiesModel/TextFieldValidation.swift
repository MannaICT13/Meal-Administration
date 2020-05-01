//
//  TextFieldValidation.swift
//  Meal Administration
//
//  Created by Md Khaled Hasan Manna on 1/5/20.
//  Copyright © 2020 Md Khaled Hasan Manna. All rights reserved.
//

import Foundation

class TextFieldValidation{
    
    public func nameValidation(_ name : String) -> Bool{
        
        
        let nameRegEx = "^(([^ ]?)(^[a-zA-Z].*[a-zA-Z]$)([^ ]?))$"
        let trimName = name.trimmingCharacters(in: .whitespaces)
        let validateName = NSPredicate(format: "SELF MATCHES %@",nameRegEx)
        let isValidateName = validateName.evaluate(with: trimName)
        
        return isValidateName
    }
    
    
    public func emailValidation(_ email: String) -> Bool{
        
        let emailRegEX = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let trimEmail = email.trimmingCharacters(in: .whitespaces)
        let validateEmail = NSPredicate(format: "SELF MATCHES %@", emailRegEX)
        let isValidateEmail = validateEmail.evaluate(with: trimEmail)
        return isValidateEmail
        
        
    }
    
   public  func phoneValidation(_ phone : String) -> Bool{
        
        let phoneRegEx = "^[0]\\d{10}$" //11 digits bangladeshi phn number
        let phoneTrim = phone.trimmingCharacters(in: .whitespaces)
        let validatePhone = NSPredicate(format: "SELF MATCHES %@", phoneRegEx)
        let isValidatePhone = validatePhone.evaluate(with: phoneTrim)
        return isValidatePhone
    }
    
    public func costValidation(_ cost: String ) ->Bool{
        
        let costRegEx = "^[0-9]\\d{6}$"
        let costTrim = cost.trimmingCharacters(in: .whitespaces)
        let validateCost = NSPredicate(format: "SELF MATCHES %@", costRegEx)
        let isValidateCost = validateCost.evaluate(with: costTrim)
        return isValidateCost
        
        
    }
    public func addressValidation(_ address : String) -> Bool{
           
             let addressRegEx = "^(([^ ]?)(^[a-zA-Z].*[a-zA-Z]$)([^ ]?))$"
             let trimAddress = address.trimmingCharacters(in: .whitespaces)
             let validateAddress = NSPredicate(format: "SELF MATCHES %@",addressRegEx)
             let isValidateAddress = validateAddress.evaluate(with: trimAddress)
             
             return isValidateAddress
    }
    
    
    
    
    
    
    
    
}
