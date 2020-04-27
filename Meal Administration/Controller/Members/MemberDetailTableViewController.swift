//
//  MemberDetailTableViewController.swift
//  Meal Administration
//
//  Created by Md Khaled Hasan Manna on 14/4/20.
//  Copyright © 2020 Md Khaled Hasan Manna. All rights reserved.
//

import UIKit

class MemberDetailTableViewController: UITableViewController {

    
    //MARK: - Properties
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var phoneLbl: UILabel!
    @IBOutlet weak var addressLbl: UILabel!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var rentLbl: UILabel!
    @IBOutlet weak var netLbl: UILabel!
    @IBOutlet weak var gassLbl: UILabel!
    @IBOutlet weak var khalaLbl: UILabel!
    @IBOutlet weak var electricityLbl: UILabel!
    @IBOutlet weak var waterLbl: UILabel!
    @IBOutlet weak var othersLbl: UILabel!
    
    
    var memberDetails : Member?
    var userEmail = String()
    var member = [Member]()
    
  
    //MARK: - init
    
    override func viewDidLoad() {
        super.viewDidLoad()

        addNavBarEditBtn()
        MemberDbHelper.instanceMemberDb.readMember(userEmail: userEmail) { (member) in
            self.member = member
        }
        tableView.reloadData()
      
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
      
        loadMemberDerails()
        MemberDbHelper.instanceMemberDb.readMember(userEmail: userEmail) { (member) in
                  self.member = member
              }
              tableView.reloadData()
       
    }

    
    
    //MARK: - Handler
    
    func loadMemberDerails(){
        
             nameLbl.text = memberDetails?.name
             phoneLbl.text = String(memberDetails!.phone)
             addressLbl.text = memberDetails?.address
             emailLbl.text = memberDetails?.email
             rentLbl.text = String(memberDetails!.rent)
             netLbl.text = String(memberDetails!.net)
             gassLbl.text = String(memberDetails!.gass)
             khalaLbl.text = String(memberDetails!.khala)
             electricityLbl.text = String(memberDetails!.current)
             waterLbl.text = String(memberDetails!.water)
             othersLbl.text = String( memberDetails!.others)
        
    }
    
    func addNavBarEditBtn(){
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Edit", style: .done, target: self, action: #selector(editBtnAction(_ :)))
        
        
        
    }
    
    @objc func editBtnAction(_ sender: UIBarButtonItem){
        
        
        let editMemberVC = storyboard?.instantiateViewController(identifier: "AddMembersViewController") as! AddMembersViewController
        editMemberVC.isUpdate = true
        
        editMemberVC.memberDetails = memberDetails
        editMemberVC.userEmail = userEmail
        
        navigationController?.pushViewController(editMemberVC, animated: true)
        
    }
    
    
    
}
    
    
   
