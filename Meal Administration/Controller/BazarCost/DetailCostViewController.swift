//
//  DetailCostViewController.swift
//  Meal Administration
//
//  Created by Md Khaled Hasan Manna on 23/4/20.
//  Copyright © 2020 Md Khaled Hasan Manna. All rights reserved.
//

import UIKit

class DetailCostViewController: UIViewController {

    
    //MARK: - Properties
    
    @IBOutlet weak var tableView: UITableView!
    var email = String()
    var userEmail = String()
    var cost = [Cost]()
    
    //MARK: init
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        BazarCostModel.bazarCostInstance.readCost(userEmail:userEmail , email: email) { (cost) in
            self.cost = cost
            self.tableView.reloadData()
        }

      
    }
    override func viewWillAppear(_ animated: Bool) {
        
         BazarCostModel.bazarCostInstance.readCost(userEmail:userEmail , email: email) { (cost) in
                   self.cost = cost
                   self.tableView.reloadData()
               }
        
    }
    

 

}
extension DetailCostViewController : UITableViewDataSource,UITableViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cost.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as UITableViewCell
        cell.textLabel?.text = cost[indexPath.row].date
        cell.detailTextLabel?.text = "\(cost[indexPath.row].cost)"+" Taka"
        return cell
    }
    
    
    
    
    
}
