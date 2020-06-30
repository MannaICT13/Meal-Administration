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
    
    
    @IBOutlet weak var yourBazarCostLbl: UILabel!
    @IBOutlet weak var totalBazarCostLbl: UILabel!
    
    @IBOutlet weak var yourMealNumberLbl: UILabel!
    @IBOutlet weak var totalMealNumberLbl: UILabel!
    
    @IBOutlet weak var mealRateLbl: UILabel!
    
    
    @IBOutlet weak var amountLbl: UILabel!
    
    
    var userEmail = String()
    var email = String()
    
    var memberDeatils : Member?
    
    var member = [Member]()
    var meal = [Meal]()
    var cost = [Cost]()
    
    
    var costDetails : Cost?
    
   
    
    
    
    //MARK: - init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ActivityIndicator.showActivityIndicator(uiView: self.view, targetVC: self)
      
        MemberDbHelper.instanceMemberDb.readMember(userEmail: userEmail) { (member) in
            self.member = member
            self.tableView.reloadData()
            
        }
        
        BazarCostModel.bazarCostInstance.readCost(userEmail: userEmail, email: email) { (cost) in
            self.cost = cost
            self.tableView.reloadData()
            
        }
        
        DailyMealDbHelper.dailyMealDbInstance.readMeal(userEmail: userEmail, email: email) { (meal) in
            self.meal = meal
            self.tableView.reloadData()
             ActivityIndicator.hideActivityIndicator(uiView: self.view)
        }
        
        yourCostFunc()
       // totalCostFunc()
       
        yourBazarCostFunc()
        yourMealNumberFunc()
        
       
        
           }
    
    override func viewWillAppear(_ animated: Bool) {
        memberDetails()
        
        MemberDbHelper.instanceMemberDb.readMember(userEmail: userEmail) { (member) in
                  self.member = member
                  self.tableView.reloadData()
              }
         BazarCostModel.bazarCostInstance.readCost(userEmail: userEmail, email: email) { (cost) in
                   self.cost = cost
                   self.tableView.reloadData()
               }
         
               DailyMealDbHelper.dailyMealDbInstance.readMeal(userEmail: userEmail, email: email) { (meal) in
                   self.meal = meal
                   self.tableView.reloadData()
               }
               
         // yourCostFunc()
         // totalCostFunc()
      
         yourBazarCostFunc()
      //  totalBazarCostFunc()
        
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
    
   /* func totalCostFunc(){
        
        let totalCost = MemberDbHelper.defaults.integer(forKey: "sum")
        
        totalCostLbl.text = "\(totalCost)"
       
        
        
    }

*/
    
    func yourBazarCostFunc(){
        
        let yourBazarCost = BazarCostModel.defaults.double(forKey: "bazarCost")
        self.yourBazarCostLbl.text = "\(yourBazarCost)"
        self.tableView.reloadData()
        
    }
    
    func yourMealNumberFunc(){
        
        let yourMeal = DailyMealDbHelper.defaults.double(forKey: "mealNumber")
        self.yourMealNumberLbl.text = "\(yourMeal)"
        self.tableView.reloadData()
        
        
        
        
        
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
