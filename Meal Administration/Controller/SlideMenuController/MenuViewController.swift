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
 
    
    //MARK: - init
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .darkGray
      
    }
    
    
    //MARK: - Handler
    
    
    func tableViewConfiguration(){
        
        tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(MenuOptionCell.self, forCellReuseIdentifier: reuseIdentifier)
        view.addSubview(tableView)
        
        
        
        
        
        
    }
    
    

}

extension MenuViewController : UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    
}
