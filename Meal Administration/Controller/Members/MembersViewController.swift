//
//  MembersViewController.swift
//  Meal Administration
//
//  Created by Md Khaled Hasan Manna on 14/4/20.
//  Copyright © 2020 Md Khaled Hasan Manna. All rights reserved.
//

import UIKit

class MembersViewController: UIViewController {

    
    //MARK: - Properties
    
    @IBOutlet weak var tableView: UITableView!
    
    var member =  [Member]()
    var userEmail = String()
   
    
    
    //MARK: - init
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

       // self.view.backgroundColor = .opaqueSeparator
        addMembersNavBarBtn()

        MemberDbHelper.instanceMemberDb.readMember(userEmail: userEmail) { member in
                   
                    self.member = member
                    self.tableView.reloadData()
                    
                }
    
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        MemberDbHelper.instanceMemberDb.readMember(userEmail: userEmail) { member in
            self.member = member
            self.tableView.reloadData()
        }
    }
    
    //MARK: - Handler
  
    
    func addMembersNavBarBtn(){
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add Members", style: .plain, target: self, action: #selector(addNavBtnAction(_ :)))
        
        
    }
    
    @objc func addNavBtnAction(_ sender : UIBarButtonItem){
        
        let addMembersVC = storyboard?.instantiateViewController(identifier: "AddMembersViewController") as! AddMembersViewController
     
         addMembersVC.userEmail = self.userEmail
       
       self.navigationController?.pushViewController(addMembersVC, animated: true)
        
        
    }
    

   

}


extension MembersViewController : UITableViewDataSource,UITableViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return member.count
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
     
        cell.layer.shadowOpacity = 0.23
        cell.layer.shadowRadius = 8
        cell.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        cell.layer.shadowColor = UIColor.white.cgColor
        
        cell.contentView.backgroundColor = Utilities.color
       // cell.contentView.layer.cornerRadius = 8
        
        //cell.contentView.layer.masksToBounds = true
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 2.0
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 2.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! MembersCell
        cell.memberNameLbl.text = member[indexPath.row].name
        cell.memberEmailLbl.text = member[indexPath.row].email
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let memberDetailVC = storyboard?.instantiateViewController(identifier: "MemberDetailTableViewController") as! MemberDetailTableViewController
        
         memberDetailVC.memberDetails = member[indexPath.row]
         memberDetailVC.userEmail = userEmail
        
      
        self.navigationController?.pushViewController(memberDetailVC, animated: true)
        
        
        
    }
    
    
    
    
    
    
}
