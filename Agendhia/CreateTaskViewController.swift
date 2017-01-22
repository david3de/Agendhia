//
//  CreateTaskViewController.swift
//  Agendhia
//
//  Created by Trevor Jordy on 1/21/17.
//  Copyright © 2017 Trevor Jordy. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class CreateTaskViewController: UIViewController, UITextFieldDelegate {
    
    var screenType = ""
    var selectedTask : Task!
    var finalStartMins : Int!
    var finalEndMins: Int!
    
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if screenType == "add" {
            label.text = "Add New Task Here"
        } else if screenType == "edit" {
            label.text = "Edit Task Here"
            TaskName.text = selectedTask.name
            NotesName.text = selectedTask.notes
        
        }
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    @IBOutlet weak var TaskName: UITextField!
    @IBOutlet weak var NotesName: UITextField!
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("method called")
        self.TaskName.endEditing(true)
        self.NotesName.endEditing(true)
        return false
    }

    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Done Segue" {
            // set st and et to -1 if they do not set both an st and an et. Will result in an untimed event
            if screenType == "add" {
                if finalStartMins == nil || finalEndMins == nil {
                    list.append(Task(name: TaskName.text!, st: -1, et : -1, notes: NotesName.text!))
                } else {
                    list.append(Task(name: TaskName.text!, st: finalStartMins, et : finalEndMins, notes: NotesName.text!))
                }
            } else if screenType == "edit" {
                selectedTask.name = TaskName.text!
                selectedTask.notes = NotesName.text!
                if finalStartMins != nil && finalEndMins != nil {
                    selectedTask.startTime = finalStartMins
                    selectedTask.endTime = finalEndMins
                }
                
            }
        }

    }
    
    @IBOutlet weak var startDatePicker: UIDatePicker!
    @IBOutlet weak var endDatePicker: UIDatePicker!
    
    @IBAction func startTimePicker(_ sender: UIDatePicker) {
        let hourFormatter = DateFormatter()
        let minuteFormatter = DateFormatter()
        
        hourFormatter.dateFormat = "H"
        let hourString = hourFormatter.string(from: sender.date)
        
        
        minuteFormatter.dateFormat = "m"
        let minuteString = minuteFormatter.string(from: sender.date)
        
        finalStartMins = Int(hourString)! * 60 + Int(minuteString)!
    }
    
    @IBAction func endTimePicker(_ sender: UIDatePicker) {
        let hourFormatter = DateFormatter()
        let minuteFormatter = DateFormatter()
        
        hourFormatter.dateFormat = "H"
        let hourString = hourFormatter.string(from: sender.date)
        
        
        minuteFormatter.dateFormat = "m"
        let minuteString = minuteFormatter.string(from: sender.date)
        
        finalEndMins = Int(hourString)! * 60 + Int(minuteString)!
    }
    
}
