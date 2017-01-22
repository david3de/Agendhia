//
//  Item_class.swift
//  Agendhia
//
//  Created by Trevor Jordy on 1/22/17.
//  Copyright © 2017 Trevor Jordy. All rights reserved.
//

import Foundation

class Item {
    var name : String
    var damage : Int
    var healthBuff : Int
    
    init(name : String, damage : Int, healthBuff : Int) {
        self.name = name
        self.damage = damage
        self.healthBuff = healthBuff
    }
}

var sword : Item = Item(name: "Sword", damage: 5, healthBuff: 0)
var shield : Item = Item(name: "Shield", damage: 0, healthBuff: 5)
