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
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! MembersCell
        cell.memberNameLbl.text = member[indexPath.row].name
        cell.memberEmailLbl.text = member[indexPath.row].email
     
        return cell
    }
    
    
    
    
    
    
}
