//
//  SecondViewController.swift
//  easyChef
//
//  Created by Zachary Peterson on 9/23/17.
//  Copyright © 2017 Zachary Peterson. All rights reserved.
//

import UIKit
var protein = 0.0
var carbs = 0.0
var fat = 0.0
class SecondViewController: UIViewController {
    
    @IBOutlet weak var fat_input: UITextField!
    @IBOutlet weak var carb_input: UITextField!
    @IBOutlet weak var protein_input: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func set_protein_input(_ sender: UIButton) {
        let myDouble = Double(protein_input.text!)
        protein = myDouble!
    }
    @IBAction func set_carb_input(_ sender: UIButton) {
        let myDouble = Double(carb_input.text!)
        carbs = myDouble!
    }
    @IBAction func set_fat_input(_ sender: UIButton) {
        let myDouble = Double(fat_input.text!)
        fat = myDouble!
    }
    
}

