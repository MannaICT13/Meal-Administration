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
            UIView.transition(with: self.tableView, duration: 0.5, options: .transitionCrossDissolve, animations: {self.tableView.reloadData()}, completion: nil)
            
        }

      
    }
    override func viewWillAppear(_ animated: Bool) {
        
         BazarCostModel.bazarCostInstance.readCost(userEmail:userEmail , email: email) { (cost) in
                   self.cost = cost
            UIView.transition(with: self.tableView, duration: 0.5, options: .transitionCrossDissolve, animations: {self.tableView.reloadData()}, completion: nil)
                  
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
    
    
    
    
    
  
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let delete = UIContextualAction(style: .destructive, title: "Delete") { (action, view, nil) in
            BazarCostModel.bazarCostInstance.removeCost(userEmail: self.userEmail, email: self.email, id: self.cost[indexPath.row].id)
            self.cost.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
            
        }
        
        
        let edit = UIContextualAction(style: .normal, title: "Edit") { (action, view, nil) in
            
            
            let alertController = UIAlertController(title: "Update Cost", message: "Want to updat cost?", preferredStyle: .alert)
            
            alertController.addTextField { (costTextField) in
                costTextField.placeholder = "Cost"
                costTextField.text = String(self.cost[indexPath.row].cost)
            }
            
            let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            
            alertController.addAction(cancel)
            
            let update = UIAlertAction(title: "Update", style: .default) { (action) in
                
                guard let cost = Double(alertController.textFields![0].text!) else{return}
               
                
                BazarCostModel.bazarCostInstance.updateCost(userEmail: self.userEmail, email: self.email,cost: cost, id:self.cost[indexPath.row].id)
                
                //self.navigationController?.popViewController(animated: true)
              
                BazarCostModel.bazarCostInstance.readCost(userEmail:self.userEmail , email: self.email) { (cost) in
                           self.cost = cost
                    UIView.transition(with: self.tableView, duration: 0.5, options: .transitionCrossDissolve, animations: {self.tableView.reloadData()}, completion: nil)
                           
                       }
                
                
            }
            alertController.addAction(update)
            self.present(alertController, animated: true, completion: nil)
            
            
            
            
        }
        let config = UISwipeActionsConfiguration(actions: [delete,edit])
        config.performsFirstActionWithFullSwipe = false
        return config
        
        
        
    }
    
    
    
    
}
