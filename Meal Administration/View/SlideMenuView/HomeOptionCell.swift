//
//  HomeOptionCell.swift
//  Meal Administration
//
//  Created by Md Khaled Hasan Manna on 30/4/20.
//  Copyright © 2020 Md Khaled Hasan Manna. All rights reserved.
//

import UIKit

class HomeOptionCell: UITableViewCell {

    //MARK: - Properties
    
    
    var iconDescription : UIImageView = {
        
        var icon = UIImageView()
        icon.contentMode = .scaleAspectFit
        icon.clipsToBounds = false
        icon.tintColor = Utilities.color
        return icon

    }()
    
    var labelDescription: UILabel = {
       
        var lbl = UILabel()
        lbl.font = UIFont.systemFont(ofSize: 25)
        lbl.textColor = Utilities.color
        return lbl
        
    }()
    //MARK: init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        iconConstraint()
        labelConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    
    
      //MARK: - Handler
      
      func iconConstraint(){
      
          addSubview(iconDescription)
          iconDescription.translatesAutoresizingMaskIntoConstraints = false
          iconDescription.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
          iconDescription.leftAnchor.constraint(equalTo: leftAnchor,constant: 10).isActive = true
          iconDescription.heightAnchor.constraint(equalToConstant: 50).isActive = true
          iconDescription.widthAnchor.constraint(equalToConstant: 50).isActive = true
          
          
          
          
          
      }
      
      func labelConstraint(){
          
           addSubview(labelDescription)
          
           labelDescription.translatesAutoresizingMaskIntoConstraints = false
           labelDescription.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
           labelDescription.leftAnchor.constraint(equalTo: iconDescription.rightAnchor,constant: 10).isActive = true
        

              
                
          
      }
      
    
}
