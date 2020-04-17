//
//  MembersCell.swift
//  Meal Administration
//
//  Created by Md Khaled Hasan Manna on 17/4/20.
//  Copyright © 2020 Md Khaled Hasan Manna. All rights reserved.
//

import UIKit

class MembersCell: UITableViewCell {

    
    //MARK: - Properties
    
    @IBOutlet weak var memberImg: UIImageView!
    @IBOutlet weak var memberNameLbl: UILabel!
    @IBOutlet weak var memberEmailLbl: UILabel!
    
    
    var img : UIImageView = {
        let icon = UIImageView()
        icon.contentMode = .scaleAspectFit
        icon.image = UIImage(systemName: "person.circle.fill")?.withRenderingMode(.alwaysOriginal).withTintColor(Utilities.color)
        icon.clipsToBounds = true
        return icon
    }()
    
    
    
    //MARK: - init
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
        memberImg.image = img.image
        
    }

  

}
