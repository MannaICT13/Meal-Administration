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
      
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
      
        loadMemberDerails()
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
    
    
    
    
    
    
    
    
    
    
    // MARK: - Table view data source
    
    

/*
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
*/
    

    
}
