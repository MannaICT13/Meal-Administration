//
//  BazarScheduleViewController.swift
//  Meal Administration
//
//  Created by Md Khaled Hasan Manna on 14/4/20.
//  Copyright © 2020 Md Khaled Hasan Manna. All rights reserved.
//

import UIKit

class BazarScheduleViewController: UIViewController {

    
    //MARK: - Properties
    @IBOutlet weak var tableView: UITableView!
    
    
      var userEmail = String()
      var schedule = [Schedule]()
    
    
    //MARK: - init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ActivityIndicator.showActivityIndicator(uiView: view, targetVC: self)
        
        BazarScheduleDbModel.bazarScheduleInstance.readSchedule(userEmail: userEmail) { (schedule) in
           
            self.schedule = schedule
            
            UIView.transition(with: self.tableView, duration: 1.0, options: .transitionCrossDissolve, animations: {self.tableView.reloadData()}, completion: nil)
            ActivityIndicator.hideActivityIndicator(uiView: self.view)
        
        }

        addScheduleNavBarBtn()
    }
    
    override func viewWillAppear(_ animated: Bool) {
             BazarScheduleDbModel.bazarScheduleInstance.readSchedule(userEmail: userEmail) { (schedule) in
               self.schedule = schedule
                
                UIView.transition(with: self.tableView, duration: 0.5, options: .transitionCrossDissolve, animations: {self.tableView.reloadData()}, completion: nil)
           }
        
    }
    
    
    //MARK: - Handler
    func addScheduleNavBarBtn(){
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add/Update Schedule", style: .plain, target: self, action: #selector(addScheduleAction( _ :)))
        
        
    }
    
    
    @objc func addScheduleAction( _ sender : UIBarButtonItem){
        
        let addBazarScheduleVC = storyboard?.instantiateViewController(identifier: "AddBazarScheduleViewController") as! AddBazarScheduleViewController
        addBazarScheduleVC.userEmail = self.userEmail
        self.navigationController?.pushViewController(addBazarScheduleVC, animated: true)
        
    }
    

}


extension BazarScheduleViewController : UITableViewDataSource,UITableViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return schedule.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 2
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 2
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        cell.backgroundColor = .clear
        cell.layer.backgroundColor = Utilities.cgColor
        cell.layer.borderWidth = 2
        cell.layer.borderColor = UIColor.white.cgColor 
        cell.layer.cornerRadius = 15
        cell.layer.masksToBounds = true
        
        cell.contentView.backgroundColor = Utilities.color
        
        
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! ScheduleCell
        
        cell.nameLbl.text = schedule[indexPath.row].name

        cell.emailLbl.text = schedule[indexPath.row].email
        
        cell.bazarDateLbl.text = "\(schedule[indexPath.row].start)"+" to "+"\(schedule[indexPath.row].end)"
        
        return cell
    }
    
    
    
}
