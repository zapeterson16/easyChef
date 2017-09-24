//
//  Ingredient.swift
//  easyChef
//
//  Created by Zachary Peterson on 9/23/17.
//  Copyright © 2017 Zachary Peterson. All rights reserved.
//

import UIKit

class Ingredient: NSObject, NSCoding{
    
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
    init(name: String){
        self.name = name
        self.protein = 0
        self.carbs = 0
        self.fat = 0
        self.servingSize = 0
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: "ingredient_name")
    }
    
    required init?(coder aDecoder: NSCoder) {
        name = aDecoder.decodeObject(forKey: "ingredient_name") as! String
        self.protein = 0
        self.carbs = 0
        self.fat = 0
        self.servingSize = 0
    }
}
