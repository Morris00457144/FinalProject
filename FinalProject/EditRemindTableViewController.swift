//
//  EditRemindTableViewController.swift
//  FinalProject
//
//  Created by User04 on 2018/6/22.
//  Copyright © 2018年 User04. All rights reserved.
//

import UIKit

class EditRemindTableViewController: UITableViewController {
    
    var remind: Remind?

    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var contentTextField: UITextField!
    @IBOutlet weak var titleTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        if let remind = remind{
            dateTextField.text = remind.time
            titleTextField.text = remind.title
            contentTextField.text = remind.content
        }
    }
    
    
   
    @IBAction func donebuttonPressed(_ sender: Any) {
        if dateTextField.text?.count == 0{
            let alertController = UIAlertController(title: "請輸入時間", message: nil, preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(action)
            present(alertController, animated: true, completion: nil)
            return
        }
        if contentTextField.text?.count == 0{
            let alertController = UIAlertController(title: "請輸入內容", message: nil, preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(action)
            present(alertController, animated: true, completion: nil)
            return
        }
        if titleTextField.text?.count == 0{
            let alertController = UIAlertController(title: "請輸入標題", message: nil, preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(action)
            present(alertController, animated: true, completion: nil)
            return
        }
        performSegue(withIdentifier: "goBackToRemindTableWithSegue", sender: nil)
        
    }
    var datePicker : UIDatePicker!
    
    @IBAction func EditDateTextField(_ sender: UITextField) {
        self.datePicker = UIDatePicker(frame:CGRect(x: 0, y:0,width: self.view.frame.size.width, height:216))
        self.datePicker.datePickerMode = UIDatePickerMode.date
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = DateFormatter.Style.medium
        dateFormatter.timeStyle = DateFormatter.Style.none
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        
        dateTextField.inputView = self.datePicker
        
        let toolBar = UIToolbar()
        toolBar.barStyle = .default
        toolBar.isTranslucent = true
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title:"Done", style: .plain, target: self ,action: #selector(self.doneClick))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelClick))
        
        toolBar.setItems([cancelButton,spaceButton,doneButton], animated: false)
            toolBar.isUserInteractionEnabled = true
            dateTextField.inputAccessoryView = toolBar
    }
    @objc func doneClick(){
        let dateFormatter1 = DateFormatter()
        dateFormatter1.dateStyle = .medium
        dateFormatter1.timeStyle = .none
        dateFormatter1.dateFormat = "yyyy-MM-dd HH:mm"
        dateTextField.text = dateFormatter1.string(for : datePicker.date)
        dateTextField.resignFirstResponder()
    }
    @objc func cancelClick(){
        dateTextField.resignFirstResponder()
    }
    func datePickerValueChanged(sender: UIDatePicker){
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        dateFormatter.dateFormat = "MMMM dd yyyy"
        dateTextField.text = dateFormatter.string(from: sender.date)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    

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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if remind == nil{
            remind = Remind(time: dateTextField.text!, title: titleTextField.text!, content: contentTextField.text!)
        }else{
            remind?.content = contentTextField.text!
            remind?.title = titleTextField.text!
            remind?.time = dateTextField.text!
        }
    }
    

}
