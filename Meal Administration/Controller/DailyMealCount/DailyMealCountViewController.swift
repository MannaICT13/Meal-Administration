//
//  DailyMealCountViewController.swift
//  Meal Administration
//
//  Created by Md Khaled Hasan Manna on 15/4/20.
//  Copyright © 2020 Md Khaled Hasan Manna. All rights reserved.
//

import UIKit

class DailyMealCountViewController: UIViewController {

    //MARK: - Properties
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var mealNumberTextField: UITextField!
    @IBOutlet weak var dateTextField: UITextField!
    
    @IBOutlet weak var nameImg: UIImageView!
    @IBOutlet weak var emailImg: UIImageView!
    @IBOutlet weak var mealNumberImg: UIImageView!
    @IBOutlet weak var dateImg: UIImageView!
    
    @IBOutlet weak var submitBtnOutlets: UIButton!
    
    @IBOutlet weak var subView: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    
    
    
    var member = [Member]()
    var userEmail = String()
    
    
    var pickerView : UIPickerView!
    var datePicker : UIDatePicker!
    
    
    
    
    
    
    //MARK: - init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(subView)
        manageDatePicker()
        managePickerView()
        
        MemberDbHelper.instanceMemberDb.readMember(userEmail: userEmail) { (member) in
            self.member = member
            self.tableView.reloadData()
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
         mangeIcon()
         utilitiManager()
         MemberDbHelper.instanceMemberDb.readMember(userEmail: userEmail) { (member) in
                   self.member = member
            self.tableView.reloadData()
               }
        
    }
    
    
    //MARK: - Handler
    
    
    @IBAction func submitBtnAction(_ sender: Any) {
        
        guard let name = nameTextField.text else{return}
        guard let email = emailTextField.text else{return}
        guard let meal = Int(mealNumberTextField.text!) else{return}
        guard let date = dateTextField.text else{return}
        
        DailyMealDbHelper.dailyMealDbInstance.writeMeal(userEmail: userEmail, name: name, email: email, meal: meal, date: date)
        
    }
    
    func mangeIcon(){
        
        nameImg.image = UIImage(systemName: "person.fill")?.withRenderingMode(.alwaysOriginal).withTintColor(Utilities.color)
        emailImg.image = UIImage(systemName: "envelope.fill")?.withRenderingMode(.alwaysOriginal).withTintColor(Utilities.color)
        mealNumberImg.image = UIImage(systemName: "list.number")?.withRenderingMode(.alwaysOriginal).withTintColor(Utilities.color)
        dateImg.image = UIImage(systemName: "clock.fill")?.withRenderingMode(.alwaysOriginal).withTintColor(Utilities.color)
        
    }
    func utilitiManager(){
        
        Utilities.roundBtnFill(button: submitBtnOutlets, color: Utilities.color)
        Utilities.lineTextFieldStyle(textField: nameTextField)
        Utilities.lineTextFieldStyle(textField: emailTextField)
        Utilities.lineTextFieldStyle(textField: mealNumberTextField)
        Utilities.lineTextFieldStyle(textField: dateTextField)
        
        
    }
    
    func manageDatePicker(){
        
        datePicker = UIDatePicker()
        
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        let done = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(action))
        toolBar.setItems([done], animated: true)
        
        dateTextField.inputView = datePicker
        dateTextField.inputAccessoryView = toolBar
        
        datePicker.datePickerMode = .date
        
        
        
        
        
    }
    
    @objc func action(){
        
        let formatter = DateFormatter()
        
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        
        if dateTextField.isFirstResponder{
            dateTextField.text = formatter.string(from: datePicker.date)
            
            
        }
        self.view.endEditing(true)
        
        
        
    }
    
    


}


extension DailyMealCountViewController : UIPickerViewDelegate,UIPickerViewDataSource{
    
    func managePickerView(){
        
        pickerView = UIPickerView()
        pickerView.delegate = self
        pickerView.dataSource = self
        
        

        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        let done = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(pickerAction(_  :)))
        toolBar.setItems([done], animated: true)
        nameTextField.inputView = pickerView
        emailTextField.inputView = pickerView
        nameTextField.inputAccessoryView = toolBar
        emailTextField.inputAccessoryView = toolBar
        
        
    }
    
    
    @objc func pickerAction(_ sender:UIBarButtonItem){
        
        self.view.endEditing(true)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return member.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if nameTextField.isFirstResponder{
            return member[row].name
        }else if emailTextField.isFirstResponder{
            return member[row].email
        }
        return nil
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
     
        if nameTextField.isFirstResponder{
            
            let selectedName = member[row].name
            nameTextField.text = selectedName
            
        }else if emailTextField.isFirstResponder{
            
            let selectedEmail = member[row].email
            emailTextField.text = selectedEmail
            
            
        }
   
    }
    
    
    
    
    
}

extension DailyMealCountViewController : UITableViewDataSource,UITableViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return member.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 4
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 4
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        cell.backgroundColor = .clear
        cell.layer.borderWidth = 2
        cell.layer.borderColor = UIColor.white.cgColor
        
        cell.layer.cornerRadius = 15
        cell.layer.masksToBounds = true
        cell.contentView.backgroundColor = Utilities.color
        
        cell.layer.shadowOpacity = 0.23
        cell.layer.shadowRadius = 8
        cell.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        cell.layer.shadowColor = UIColor.black.cgColor
        
        
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! DailyMealCell
        cell.nameLbl.text = member[indexPath.row].name
        cell.emailLbl.text = member[indexPath.row].email
      
        
        return cell
    }
    
    
    
}
