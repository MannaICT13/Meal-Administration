//
//  DetailCalculationViewController.swift
//  Meal Administration
//
//  Created by Md Khaled Hasan Manna on 27/4/20.
//  Copyright © 2020 Md Khaled Hasan Manna. All rights reserved.
//

import UIKit

class DetailCalculationViewController: UITableViewController {

    //MARK: - Properties
    
    @IBOutlet weak var rentLbl: UILabel!
    @IBOutlet weak var netLbl: UILabel!
    @IBOutlet weak var gassLbl: UILabel!
    @IBOutlet weak var khalaLbl: UILabel!
    @IBOutlet weak var electricityLbl: UILabel!
    @IBOutlet weak var waterLbl: UILabel!
    @IBOutlet weak var othersLbl: UILabel!
    
    @IBOutlet weak var yourCostLbl: UILabel!
    @IBOutlet weak var totalCostLbl: UILabel!
    
    
    @IBOutlet weak var yourBazarCost: UILabel!
    @IBOutlet weak var totalBazarCost: UILabel!
    
    @IBOutlet weak var yourMealNumberLbl: UILabel!
    @IBOutlet weak var totalMealNumberLbl: UILabel!
    
    @IBOutlet weak var mealRateLbl: UILabel!
    
    
    @IBOutlet weak var amountLbl: UILabel!
    
    
    var userEmail = String()
    var memberDeatils : Member?
    var member = [Member]()
    
    
    
    //MARK: - init
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        MemberDbHelper.instanceMemberDb.readMember(userEmail: userEmail) { (member) in
            self.member = member
            self.tableView.reloadData()
        }
        

        yourCostFunc()
        totalCostFunc()
           }
    
    override func viewWillAppear(_ animated: Bool) {
        memberDetails()
        MemberDbHelper.instanceMemberDb.readMember(userEmail: userEmail) { (member) in
                  self.member = member
                  self.tableView.reloadData()
              }
        
          yourCostFunc()
        totalCostFunc()
        
    }
    
    func memberDetails(){
        
        rentLbl.text = String(memberDeatils!.rent)
        netLbl.text = String(memberDeatils!.net)
        gassLbl.text = String(memberDeatils!.gass)
        khalaLbl.text = String(memberDeatils!.khala)
        electricityLbl.text = String(memberDeatils!.current)
        waterLbl.text = String(memberDeatils!.water)
        othersLbl.text = String(memberDeatils!.others)
        
    }
    
    func yourCostFunc(){
        
        let rent = Int(memberDeatils!.rent)
        let net = Int(memberDeatils!.net)
        let gass = Int(memberDeatils!.gass)
        let khala = Int(memberDeatils!.khala)
        let current = Int(memberDeatils!.current)
        let water = Int(memberDeatils!.water)
        let others = Int(memberDeatils!.others)
        
        let  sum = (rent + net + gass + khala + current + water + others)
        yourCostLbl.text = "\(sum)"
        
        
    }
    func totalCostFunc(){
        
        let totalCost = MemberDbHelper.defaults.integer(forKey: "sum")
        
        totalCostLbl.text = "\(totalCost)"
       
        
        
    }
   
    
    
    
    
    
}
extension DetailCalculationViewController{
    
    
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        view.tintColor = Utilities.color
        
        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.textColor = UIColor.white
        header.textLabel?.font = UIFont.systemFont(ofSize: 25.0)
        
    }
    
    
    
    
    
}
