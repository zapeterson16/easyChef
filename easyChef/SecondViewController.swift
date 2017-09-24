//
//  SecondViewController.swift
//  easyChef
//
//  Created by Zachary Peterson on 9/23/17.
//  Copyright © 2017 Zachary Peterson. All rights reserved.
//

import UIKit
class SecondViewController: UIViewController {
    /*
    var protein = 0.0
    var carbs = 0.0
    var fat = 0.0
    */
 
    let myDefaults = UserDefaults.init()
    
    let protein_calorie_input = "protein_calorie_input"
    let carb_calorie_input = "carb_calorie_input"
    let fat_calorie_input = "fat_calorie_input"
    
    @IBOutlet weak var fat_input: UITextField!
    @IBOutlet weak var carb_input: UITextField!
    @IBOutlet weak var protein_input: UITextField!
    @IBOutlet weak var sanity_check: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        protein_input.text = String(myDefaults.double(forKey: protein_calorie_input))
        carb_input.text = String(myDefaults.double(forKey: carb_calorie_input))
        fat_input.text = String(myDefaults.double(forKey: carb_calorie_input))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Action of the three buttons, saving the values into the NSUserDafault
    @IBAction func set_protein_input(_ sender: UIButton) {
        let myDouble = Double(protein_input.text!)
        myDefaults.set(myDouble, forKey:protein_calorie_input)
    }
    @IBAction func set_carb_input(_ sender: UIButton) {
        let myDouble = Double(carb_input.text!)
        myDefaults.set(myDouble, forKey:carb_calorie_input)
    }
    @IBAction func set_fat_input(_ sender: UIButton) {
        let myDouble = Double(fat_input.text!)
        myDefaults.set(myDouble, forKey:fat_calorie_input)
    }
    @IBAction func check(_ sender: UIButton) {
        sanity_check.text = String(myDefaults.double(forKey: protein_calorie_input))
    }
}

