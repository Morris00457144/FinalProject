//
//  EditAccountTableViewController.swift
//  FinalProject
//
//  Created by User04 on 2018/6/22.
//  Copyright © 2018年 User04. All rights reserved.
//

import UIKit

class EditAccountTableViewController: UITableViewController {

    var account: Account?
    
    @IBOutlet weak var moneyTextField: UITextField!
    @IBOutlet weak var itemTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        if let account = account{
            itemTextField.text = account.item
            moneyTextField.text = account.money
        }
    }
    
    
    @IBAction func doneButtonPressed(_ sender: Any) {
            if itemTextField.text?.count == 0{
                let alertController = UIAlertController(title: "請輸入項目", message: nil, preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                alertController.addAction(action)
                present(alertController, animated: true, completion: nil)
                return
            }
            if moneyTextField.text?.count == 0{
                let alertController = UIAlertController(title: "請輸入金額", message: nil, preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                alertController.addAction(action)
                present(alertController, animated: true, completion: nil)
                return
            }
            performSegue(withIdentifier: "goBackToAccountTableWithSegue", sender: nil)
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
        
        if account == nil{
            account = Account(item: itemTextField.text!, money: moneyTextField.text!)
        }else{
            account?.item = itemTextField.text!
            account?.money = moneyTextField.text!
        }
        
    }
    

}
