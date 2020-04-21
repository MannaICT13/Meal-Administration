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
        
       // self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "reuseCell")
        

        
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
    
    
    
    
}
