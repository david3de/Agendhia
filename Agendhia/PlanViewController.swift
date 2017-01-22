//
//  PlanViewController.swift
//  Agendhia
//
//  Created by Trevor Jordy on 1/21/17.
//  Copyright © 2017 Trevor Jordy. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import FirebaseDatabase

class PlanViewController: UIViewController {
    
    //MARK: properties/connections
    @IBOutlet weak var scrollView: UIScrollView!
    
    // labels
    @IBOutlet weak var petNameLabel: UILabel!
    @IBOutlet weak var healthAmountLabel: UILabel!
    @IBOutlet weak var staminaAmountLabel: UILabel!
    @IBOutlet weak var foodAmountLabel: UILabel!
    @IBOutlet weak var goldAmountLabel: UILabel!
    // bar connections
    @IBOutlet weak var healthBarConnection: UIProgressView!
    @IBOutlet weak var staminaBarConnection: UIProgressView!
    @IBOutlet weak var foodBarConnection: UIProgressView!
    
    let screenSize: CGRect = UIScreen.main.bounds
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.

        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //scrollView.reloadInputViews()
        loadView()
        
        // set labels
        goldAmountLabel.text = String(goldAmount)
        healthAmountLabel.text = String(Int(healthAmount)) + "/100"
        staminaAmountLabel.text = String(Int(staminaAmount)) + "/100"
        foodAmountLabel.text = String(Int(foodAmount)) + "/100"
        
        
        // set progress bars
        healthBarConnection.progress = Float(healthAmount / 100)
        staminaBarConnection.progress = Float(staminaAmount / 100)
        foodBarConnection.progress = Float(foodAmount / 100)
        // MARK: set time labels
        
        let timeArray : [String] = ["5am", "6am", "7am", "8am", "9am", "10am", "11am", "12pm", "1pm", "2pm", "3pm", "4pm", "5pm", "6pm", "7pm", "8pm", "9pm", "10pm", "11pm", "12am"]
        
        var label : UILabel
        for i in 0...timeArray.count-1 {
            
            label = UILabel(frame: CGRect(x: 10, y: 250, width: 50, height: 50))
            label.center = CGPoint(x: 30, y: 250 + (i * 100))
            label.textAlignment = .center
            label.text = timeArray[i]
            self.scrollView.addSubview(label)
            
            
        }
        // create events
        for item in list {
            if item.startTime > 0 && item.endTime > 0 {
                createEvent(input: item)
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: complete and fail tasks
    @IBAction func failTask(_ sender: UIButton) {
        foodAmount -= 10
        // correct ammounts
        if foodAmount < 0 { foodAmount = 0}
        
        foodAmountLabel.text = String(Int(foodAmount)) + "/100"
        foodBarConnection.progress = Float(foodAmount / 100)
        
        // Firebase push, currently only deals with single pet
        ref = FIRDatabase.database().reference()
        let user = String (describing: FIRAuth.auth()?.currentUser?.uid)
        ref?.child("users").child(user).child("pet").setValue(["healthAmount": healthAmount,
                                                               "foodAmount": foodAmount,
                                                               "staminaAmount": staminaAmount])
    }
    @IBAction func completeTask(_ sender: UIButton) {
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
    }
    
    func timeToYConverter(time : Int) -> Int{
        var timeFromFive = time - 300
        if time < 300 {
            timeFromFive += 1440
        }
        let hours = timeFromFive/60
        let minutes = timeFromFive%60
        
        let yPos = (hours * 100) + (100*minutes)/60 + 250
        
        return yPos
    }
    
    func createEvent( time : Int, len : Int) {
        let DynamicView=UIView(frame: CGRect(x: 70, y: timeToYConverter(time: time), width: Int(screenSize.width - 20), height: len * 100/60))
        DynamicView.backgroundColor = UIColor.cyan
        DynamicView.layer.borderWidth = 0
        self.scrollView.addSubview(DynamicView)
    }
    
    func createEvent( input : Task) {
        print(input.startTime)
        let len = timeToYConverter(time: input.endTime) - timeToYConverter(time: input.startTime)
        print(timeToYConverter(time: input.startTime))
        let DynamicView = UIView(frame: CGRect(x: 70, y: timeToYConverter(time: input.startTime), width: Int(screenSize.width - 20), height: len))
        DynamicView.backgroundColor = UIColor.cyan
        DynamicView.layer.borderWidth = 0
    
        let label = UILabel(frame: CGRect(x: 10, y: 10 , width: 100, height: 20))
        label.textAlignment = .center
        label.text = input.name
        DynamicView.addSubview(label)
        
        let label2 = UILabel(frame: CGRect(x: 10, y: 50 , width: 100, height: 20))
        label2.textAlignment = .center
        label2.text = "\(input.startTime/60):\(input.startTime%60) - \(input.endTime/60):\(input.endTime%60)"
        DynamicView.addSubview(label2)
        
        self.scrollView.addSubview(DynamicView)
        
        
    }
}
