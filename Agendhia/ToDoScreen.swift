//
//  ToDoScreen.swift
//  Agendhia
//
//  Created by Trevor Jordy on 1/21/17.
//  Copyright © 2017 Trevor Jordy. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import FirebaseDatabase

// Firebase global reference
var ref: FIRDatabaseReference?

class ToDoScreen: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var detailLabel: UILabel!
    
    var chosen : Task?

    //insert empty array list

    @IBOutlet weak var goldAmountLabel: UILabel!
    @IBOutlet weak var healthAmountLabel: UILabel!
    @IBOutlet weak var staminaAmountLabel: UILabel!
    @IBOutlet weak var foodAmountLabel: UILabel!
    @IBOutlet weak var healthBarConnection: UIProgressView!
    @IBOutlet weak var staminaBarConnection: UIProgressView!
    @IBOutlet weak var foodBarConnection: UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        
        
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // set labels
        goldAmountLabel.text = String(goldAmount)
        healthAmountLabel.text = String(Int(healthAmount)) + "/100"
        staminaAmountLabel.text = String(Int(staminaAmount)) + "/100"
        foodAmountLabel.text = String(Int(foodAmount)) + "/100"
        
        
        // set progress bars
        healthBarConnection.progress = Float(healthAmount / 100)
        staminaBarConnection.progress = Float(staminaAmount / 100)
        foodBarConnection.progress = Float(foodAmount / 100)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let reuseIdentifier = "cell"
        var cell:UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier) as UITableViewCell?
        if (cell == nil) {
            cell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: reuseIdentifier)
        }
        cell!.textLabel?.text = list[indexPath.row].name
        cell!.detailTextLabel?.text = list[indexPath.row].notes
        return cell!
    }
    
    
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let complete = UITableViewRowAction(style: .default, title: "\u{20DD}\n complete") { action, index in
            // set variables for rpg here
            list.remove(at:)(indexPath.row)
            self.completeTask()
            self.tableView.reloadData()
            print("Task Completed") }
        complete.backgroundColor = UIColor(red: 0.2372100629, green: 0.6997449806, blue: 0.2947102354, alpha: 1)
        
        let delete = UITableViewRowAction(style: .default, title: "\u{2715}\n remove") {
            _,_ in self.deleteTaskIndexPath = indexPath as IndexPath? as NSIndexPath?
            let taskToDelete = list[indexPath.row].name
            self.confirmDelete(list: taskToDelete)
        }
        delete.backgroundColor = UIColor(red: 0.93, green: 0.14, blue: 0.14, alpha: 1.0)
        
        return [delete, complete]
        
    }
    
    var deleteTaskIndexPath: NSIndexPath? = nil
    
    func confirmDelete(list: String) {
        let alert = UIAlertController(title: "Delete Task", message: "Are you sure you want to permently delete \(list)?",
            preferredStyle: .actionSheet)
        
        let DeleteAction = UIAlertAction(title: "Delete", style: .destructive, handler: handleDeleteTask)
        let CancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: cancelDeleteTask)
        
        alert.addAction(DeleteAction)
        alert.addAction(CancelAction)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func handleDeleteTask(alertAction: UIAlertAction!) -> Void {
        if let indexPath = deleteTaskIndexPath {
            tableView.beginUpdates()
            
            list.remove(at: indexPath.row)
            
            tableView.deleteRows(at: [indexPath as IndexPath], with: .automatic)
            
            deleteTaskIndexPath = nil
            tableView.endUpdates()
        }
    }
    
    func cancelDeleteTask(alertAction: UIAlertAction!) {
        deleteTaskIndexPath = nil
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt
        indexPath: IndexPath){
        print("for")
        chosen = list[indexPath.row]
        performSegue(withIdentifier: "cellSegue", sender: nil)
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let svc = segue.destination as! CreateTaskViewController
       
        if segue.identifier == "cellSegue" {
            svc.screenType = "edit"
            svc.selectedTask = chosen
        }
        if segue.identifier == "addSegue" {
            svc.screenType = "add"
        }
    }
    
    func completeTask() {
        // alter values
        healthAmount += 10
        foodAmount += 10
        staminaAmount += 10
        goldAmount += 5
        // correct amounts
        if healthAmount > 100 { healthAmount = 100}
        if staminaAmount > 100 { staminaAmount = 100}
        if foodAmount > 100 { foodAmount = 100}
        
        healthAmountLabel.text = String(Int(healthAmount)) + "/100"
        foodAmountLabel.text = String(Int(foodAmount)) + "/100"
        staminaAmountLabel.text = String(Int(staminaAmount)) + "/100"
        goldAmountLabel.text = String(goldAmount)
        
        
        healthBarConnection.progress = Float(healthAmount / 100)
        staminaBarConnection.progress = Float(staminaAmount / 100)
        foodBarConnection.progress = Float(foodAmount / 100)
        
        self.tableView.reloadData()
        // Firebase push, currently only deals with single pet
        ref = FIRDatabase.database().reference()
        let user = String (describing: FIRAuth.auth()?.currentUser?.uid)
        ref?.child("users").child(user).setValue(["goldAmount": goldAmount])
        ref?.child("users").child(user).child("pet").setValue(["healthAmount": healthAmount,
                                                               "foodAmount": foodAmount,
                                                               "staminaAmount": staminaAmount])
        
        self.tableView.reloadData()
    }
    
}
