//
//  CalculationCell.swift
//  Meal Administration
//
//  Created by Md Khaled Hasan Manna on 27/4/20.
//  Copyright © 2020 Md Khaled Hasan Manna. All rights reserved.
//

import UIKit

class CalculationCell: UITableViewCell {

    //MARK:- Properties 
    
    @IBOutlet weak var iconImg: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var emailLbl: UILabel!
    
    
    var personImg : UIImageView = {
       
        let img = UIImageView()
        img.contentMode = .scaleAspectFit
        img.image = UIImage(systemName: "person.circle.fill")?.withRenderingMode(.alwaysOriginal).withTintColor(Utilities.color)
        img.layer.masksToBounds = true
        
        return img
    }()
    
    
    
    
    
    //MARK: - init
    override func awakeFromNib() {
        super.awakeFromNib()
        
        iconImg.image = personImg.image
    
    }


}
