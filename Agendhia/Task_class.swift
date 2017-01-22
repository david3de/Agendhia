//
//  Task_class.swift
//  Agendhia
//
//  Created by Trevor Jordy on 1/21/17.
//  Copyright © 2017 Trevor Jordy. All rights reserved.
//

import Foundation
import FirebaseDatabase

class Task{
    var name: String
    var startTime: Int
    var endTime: Int
    var notes: String
    init (name: String, st: Int, et: Int, notes: String){
        self.name = name
        self.startTime = st
        self.endTime = et
        self.notes = notes
    }
    init(snapshot: FIRDataSnapshot) {
        let snapshotValue = snapshot.value as! [String: AnyObject]
        name = snapshotValue["name"] as! String
        startTime = Int(snapshotValue["startTime"] as! Double)
        endTime = Int(snapshotValue["endTime"] as! Double)
        notes = snapshotValue["notes"] as! String
    }
    
    
}
var list : [Task] = []


