//
//  MenuViewController.swift
//  Meal Administration
//
//  Created by Md Khaled Hasan Manna on 13/4/20.
//  Copyright © 2020 Md Khaled Hasan Manna. All rights reserved.
//

import UIKit

private let reuseIdentifier = "MenuOptionCell"

class MenuViewController: UIViewController {

    
    //MARK: - Properties
    
    var tableView : UITableView!
 
    var deleagte : HomeControllerDelegate!
    
    //MARK: - init
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .darkGray
        tableViewConfiguration()
      
    }
    
    
    //MARK: - Handler
    
    
    func tableViewConfiguration(){
        
        tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = Utilities.color
        tableView.separatorColor = UIColor.white
        tableView.tableFooterView = UIView()
        tableView.register(MenuOptionCell.self, forCellReuseIdentifier: reuseIdentifier)
        view.addSubview(tableView)
        tableViewConstraint()
    
        
        
        
    }
    func tableViewConstraint(){
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
       
    }
  
    
    

}

extension MenuViewController : UITableViewDelegate,UITableViewDataSource{
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! MenuOptionCell
        
        let menuDescription = MenuOption(rawValue: indexPath.row)
        cell.iconDescription.image = menuDescription?.iconDescription
        cell.labelDescription.text = menuDescription?.description
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let menuDescription = MenuOption(rawValue: indexPath.row)
        deleagte!.handleToggle(menuOption: menuDescription)
        
    }
    
    
}
