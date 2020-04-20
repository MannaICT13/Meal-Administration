//
//  DailyMealCell.swift
//  Meal Administration
//
//  Created by Md Khaled Hasan Manna on 21/4/20.
//  Copyright © 2020 Md Khaled Hasan Manna. All rights reserved.
//

import UIKit

class DailyMealCell: UITableViewCell {

    
    //MARK: - Properties
    @IBOutlet weak var iconImg: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var emailLbl: UILabel!
    
    var iconSetUp :UIImageView = {
        
        let icon = UIImageView()
        icon.image = UIImage(systemName: "person.fill")?.withRenderingMode(.alwaysOriginal).withTintColor(.white)
        return icon
        
    }()
    
    
    
    //MARK: - init
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        iconImg.image = iconSetUp.image
    }
    
    

   

}
