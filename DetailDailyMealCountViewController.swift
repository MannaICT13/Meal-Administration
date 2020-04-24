//
//  DetailDailyMealCountViewController.swift
//  
//
//  Created by Md Khaled Hasan Manna on 22/4/20.
//

import UIKit

class DetailDailyMealCountViewController: UIViewController {

    
    
    //MARK: - Properties
    
    @IBOutlet weak var tableView: UITableView!
    var userEmail = String()
    var email = String()
    var meal = [Meal]()

    //MARK: - init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DailyMealDbHelper.dailyMealDbInstance.readMeal(userEmail: userEmail, email: email) { (meal) in
        
            self.meal = meal
            self.tableView.reloadData()
        }
    

        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        DailyMealDbHelper.dailyMealDbInstance.readMeal(userEmail: userEmail, email: email) { (meal) in
        
            self.meal = meal
            self.tableView.reloadData()
        }
    }
    
    
    
    
    //MARK: - Handler
    


}

extension DetailDailyMealCountViewController : UITableViewDataSource,UITableViewDelegate {
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meal.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as UITableViewCell
        
        cell.textLabel?.text = meal[indexPath.row].date
        cell.detailTextLabel?.text = String(meal[indexPath.row].meal)
        
        
        return cell
    }
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let delete = UIContextualAction(style: .destructive, title: "Delete") { (deleteAction, view, nil) in
            
        
            DailyMealDbHelper.dailyMealDbInstance.removeMeal(userEmail: self.userEmail, email: self.email, id: self.meal[indexPath.row].id)
             self.meal.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
           
            
            
            
        }
        let update = UIContextualAction(style: .normal, title: "Update") { (updateAction, view, nil) in
            
            let alertController = UIAlertController(title: "Update Message", message: "Want to update Meal?", preferredStyle: .alert)
            alertController.addTextField { (mealTextField) in
                mealTextField.placeholder = "Meal"
                mealTextField.text = String(self.meal[indexPath.row].meal)
            }
            let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            alertController.addAction(cancel)
            
            let update = UIAlertAction(title: "Update", style: .default) { (action) in
                
                guard let meal = Double(alertController.textFields![0].text!) else{return}
                
                DailyMealDbHelper.dailyMealDbInstance.updateMeal(userEmail: self.userEmail, email: self.email, meal: meal, id: self.meal[indexPath.row].id)
                

                DailyMealDbHelper.dailyMealDbInstance.readMeal(userEmail: self.userEmail, email: self.email) { (meal) in
                
                    self.meal = meal
                    self.tableView.reloadData()
                }
                
                
            }
            alertController.addAction(update)
            self.present(alertController, animated: true, completion: nil)
            
        }
        
        let config = UISwipeActionsConfiguration(actions: [delete,update])
        config.performsFirstActionWithFullSwipe = false
        return config
        
        
    }
    
    
    
    
}
