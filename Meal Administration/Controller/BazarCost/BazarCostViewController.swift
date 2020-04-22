//
//  BazarCostViewController.swift
//  Meal Administration
//
//  Created by Md Khaled Hasan Manna on 15/4/20.
//  Copyright © 2020 Md Khaled Hasan Manna. All rights reserved.
//

import UIKit

class BazarCostViewController: UIViewController {

    
    //MARK: - Properties
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var userEmail = String()
    var member = [Member]()
 
    
    //MARK: - init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addCostNavBarBtn()
        MemberDbHelper.instanceMemberDb.readMember(userEmail: userEmail) { (member) in
            self.member = member
            self.tableView.reloadData()
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
         MemberDbHelper.instanceMemberDb.readMember(userEmail: userEmail) { (member) in
                   self.member = member
                   self.tableView.reloadData()
               }
        
    }
  
    
    //MARK: - Handler
    
    func addCostNavBarBtn(){
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add Cost", style: .plain, target: self, action: #selector(addCostAction(_: )))
        
        
    }
    
    @objc func addCostAction(_ sender : UIBarButtonItem){
        
        let addBazarCostVC = storyboard?.instantiateViewController(identifier: "AddBazarCostViewController") as! AddBazarCostViewController
        addBazarCostVC.userEmail = self.userEmail
        self.navigationController?.pushViewController(addBazarCostVC, animated: true)
        
        
        
    }
    


}
extension BazarCostViewController : UITableViewDataSource,UITableViewDelegate{
    
    
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
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        cell.backgroundColor = .clear
        cell.layer.borderWidth = 2
        cell.layer.borderColor = UIColor.white.cgColor
        cell.layer.masksToBounds = true
        cell.layer.cornerRadius = 15.0
        
        cell.contentView.backgroundColor = Utilities.color
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! BazarCostCell
        cell.nameLbl.text = member[indexPath.row].name
        cell.emailLbl.text = member[indexPath.row].email
        
        return cell
    }
    
    
}



