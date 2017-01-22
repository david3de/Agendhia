//
//  Pet_class.swift
//  Agendhia
//
//  Created by Trevor Jordy on 1/22/17.
//  Copyright © 2017 Trevor Jordy. All rights reserved.
//

import Foundation

class Pet {
    var name : String
    var level : Int
    var maxHealth : Int
    var currentHealth : Int
    var maxStamina : Int
    var currentStamina : Int
    var damage : Int
    var speed : Int
    
    init( name : String, level : Int, maxHealth : Int, currentHealth : Int, maxStamina : Int, currentStamina : Int, damage : Int, speed : Int) {
        self.name = name
        self.level = level
        self.maxHealth = maxHealth
        self.currentHealth = currentHealth
        self.maxStamina = maxStamina
        self.currentStamina = currentStamina
        self.damage = damage
        self.speed = speed
    }
}
var stable : [Pet] = [blob]
var blob : Pet = Pet(name: "Blob", level: 1, maxHealth: 50, currentHealth: 50, maxStamina: 50, currentStamina: 50, damage: 10, speed: 5)

var healthAmount = 100.0
var staminaAmount = 100.0
var foodAmount = 100.0
var goldAmount = 0
