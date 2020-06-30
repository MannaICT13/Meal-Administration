//
//  CalculationViewController.swift
//  Meal Administration
//
//  Created by Md Khaled Hasan Manna on 27/4/20.
//  Copyright © 2020 Md Khaled Hasan Manna. All rights reserved.
//

import UIKit

class CalculationViewController: UIViewController {

    //MARK: - Properties
    
    var userEmail = String()
    var member = [Member]()
    
    @IBOutlet weak var tableView: UITableView!
    
    //MARk: - init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ActivityIndicator.showActivityIndicator(uiView: self.view, targetVC: self)
        
        MemberDbHelper.instanceMemberDb.readMember(userEmail: userEmail) { (member) in
            
            self.member = member
        
            UIView.transition(with: self.tableView, duration: 1.0, options: .transitionCrossDissolve, animations: {self.tableView.reloadData()}, completion: nil)
            ActivityIndicator.hideActivityIndicator(uiView: self.view)
        }
    

  
    }
    
    //MARK: - Handler
    


}

extension CalculationViewController : UITableViewDataSource,UITableViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return member.count
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 2
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 2
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        cell.backgroundColor = .clear
        cell.layer.borderWidth = 2.0
        cell.layer.borderColor = UIColor.white.cgColor
        cell.layer.masksToBounds = true
        cell.layer.cornerRadius = 15.0
        
        cell.layer.shadowOpacity = 0.23
        cell.layer.shadowRadius = 8
        cell.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        cell.layer.shadowColor = UIColor.white.cgColor
           
          
        cell.contentView.backgroundColor = Utilities.color
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! CalculationCell
        cell.nameLbl.text = member[indexPath.row].name
        cell.emailLbl.text = member[indexPath.row].email
      
        
        return cell
        
        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let detailCalculationVC = storyboard?.instantiateViewController(identifier: "DetailCalculationViewController") as! DetailCalculationViewController
        
        detailCalculationVC.userEmail = self.userEmail
        detailCalculationVC.email = member[indexPath.row].email
        detailCalculationVC.memberDeatils = member[indexPath.row]

        
        self.navigationController?.pushViewController(detailCalculationVC, animated: true)

       
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
}
