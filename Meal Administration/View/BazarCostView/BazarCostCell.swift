//
//  BazarCostCell.swift
//  Meal Administration
//
//  Created by Md Khaled Hasan Manna on 23/4/20.
//  Copyright © 2020 Md Khaled Hasan Manna. All rights reserved.
//

import UIKit

class BazarCostCell: UITableViewCell {

    //MARK: - Properties
    @IBOutlet weak var iconImg: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var emailLbl: UILabel!
    
    var img : UIImageView = {
        let icon = UIImageView()
        icon.contentMode = .scaleAspectFit
        icon.image = UIImage(systemName: "person.circle.fill")?.withRenderingMode(.alwaysOriginal).withTintColor(.white)
        return icon
        
        
    }()
    
    //MARK: - init
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        iconImg.image = img.image
        
    }

  

}
