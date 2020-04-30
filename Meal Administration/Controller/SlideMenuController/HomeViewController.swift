//
//  HomeViewController.swift
//  Meal Administration
//
//  Created by Md Khaled Hasan Manna on 13/4/20.
//  Copyright © 2020 Md Khaled Hasan Manna. All rights reserved.
//

import UIKit

private let reuseIdentifier = "HomeOptionCell"

class HomeViewController: UIViewController {

    //MARK: - Properties
    
    var delegate : HomeControllerDelegate!
    var uiImage : UIImageView!
    var tableView : UITableView!
 
   
    //MARK: - init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        self.view.backgroundColor = UIColor.white
        navBarConfiguration()
      //  backgroundImg()
     
    
    }
    //MARK: - Handler
    
    @objc func handleToggle(_ sender: UIBarButtonItem){
        
        delegate.handleToggle(menuOption: nil)
        
    }
    
    
    
    //added a navigationbar with left button
    
    func navBarConfiguration(){
        
        let navBar = navigationController?.navigationBar
        navBar?.barTintColor = Utilities.color
        navBar?.tintColor = .white
        navBar?.isTranslucent = false
        navBar?.titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
      
       navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "line.horizontal.3")?.withRenderingMode(.alwaysOriginal).withTintColor(.white), style: .plain, target: self, action: #selector(handleToggle(_ :)))
        
        
        
    }
    
    func backgroundImg(){
        
        uiImage = UIImageView()
        uiImage.image = UIImage(named: "logo2")
        uiImage.contentMode = .scaleAspectFit
        uiImage.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        view.addSubview(uiImage)
        
        
   
    }
    
    
    
    
    
    
    

   

}

extension HomeViewController : UITableViewDataSource,UITableViewDelegate {
    
    
    func configureTableView(){
        
        
        tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
       // tableView.backgroundColor = Utilities.color
        tableView.separatorColor = Utilities.color
        tableView.tableFooterView = UIView()
        tableView.register(HomeOptionCell.self, forCellReuseIdentifier: reuseIdentifier)
        tableViewConstraint()
        view.addSubview(tableView)
        
        
        
    }
    func tableViewConstraint(){
        
        let screenSize = UIScreen.main.bounds
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height
         
        tableView.frame = CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight)
            
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! HomeOptionCell
              
              let homeDescription = HomeOption(rawValue: indexPath.row)
              cell.iconDescription.image = homeDescription?.iconImgDescription
              cell.labelDescription.text = homeDescription?.description
              
              return cell
    }
    
      
      func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
          
    
        if indexPath.row == 0{
            
            delegate.handleToggle(menuOption: nil)
            
        }else if indexPath.row == 1{
             delegate.handleToggle(menuOption: nil)
            
        }else if indexPath.row == 2{
             delegate.handleToggle(menuOption: nil)
            
        }else if indexPath.row == 3{
            
             delegate.handleToggle(menuOption: nil)
            
        }else if indexPath.row == 4{
             delegate.handleToggle(menuOption: nil)
            
        }else if indexPath.row == 5{
            
             delegate.handleToggle(menuOption: nil)
            
        }
        
        
        
      }
    
    
}
