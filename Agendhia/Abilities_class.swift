//
//  Spell_class.swift
//  Agendhia
//
//  Created by Trevor Jordy on 1/22/17.
//  Copyright © 2017 Trevor Jordy. All rights reserved.
//

import Foundation

class Abilities {
    var name : String
    var damage : Int
    var staminaCost : Int
    
    init( name : String, damage : Int, staminaCost : Int) {
        self.name = name
        self.damage = damage
        self.staminaCost = staminaCost
    }
    
    
}
var slash : Abilities = Abilities(name : "Slash", damage : 5, staminaCost : 10)
var bite : Abilities = Abilities(name : "Bite", damage : 9, staminaCost : 20)
