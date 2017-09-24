//
//  Ingredient.swift
//  easyChef
//
//  Created by Zachary Peterson on 9/23/17.
//  Copyright © 2017 Zachary Peterson. All rights reserved.
//

import UIKit

class Ingredient{
    var name: String
    var protein: Int
    var carbs: Int
    var fat: Int
    var servingSize: Int //in grams
    
    init(name: String, protein: Int, carbs: Int, fat: Int, servingSize: Int){
        self.name = name
        self.protein = protein
        self.carbs = carbs
        self.fat = fat
        self.servingSize = servingSize
        
        
    }
}
