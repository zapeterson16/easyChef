//
//  FirstViewController.swift
//  easyChef
//
//  Created by Zachary Peterson on 9/23/17.
//  Copyright © 2017 Zachary Peterson. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource {
    
    let myDefaults = UserDefaults.init()
    let ingredient_list = "ingredient_list"
    
    //MARK: Properties
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var nameMealLabel: UILabel!
    @IBOutlet weak var ingredientTableView: UITableView!
    
    var ingredients = [Ingredient]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let temp = Ingredient(name: "test4")
        loadData()
//        ingredients = myDefaults.array(forKey: ingredient_list) as? [Ingredient] ?? [Ingredient]()
        // Handle the text field’s user input through delegate callbacks.
        nameTextField.delegate = self
        ingredientTableView.delegate = self
        ingredientTableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: Actions
    
    @IBAction func setDefaultLabelText(_ sender: UIButton) {
        nameMealLabel.text = "Default text"
        
    }
    
    // MARK: UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //hide the keyboard
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextFieldDidEndEditingReason) {
        let temp = Ingredient.init(name: textField.text!)
        ingredients.append(temp)
        saveData()
        ingredientTableView.reloadData()
        textField.text = ""
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // your cell coding
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "IngredientTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? IngredientTableViewCell  else {
            fatalError("The dequeued cell is not an instance of IngredientTableViewCell.")
        }
        
        // Fetches the appropriate meal for the data source layout.
        let ingredient = ingredients[indexPath.row]
        
        cell.nameLabel.text = ingredient.name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // cell selected code here
    }
    // Override to support editing the table view.
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            ingredients.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            saveData()
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ingredients.count
    }
    func loadData(){
        let ingredientData = myDefaults.object(forKey: ingredient_list) as? NSData
        if ingredientData != nil {
            ingredients = (NSKeyedUnarchiver.unarchiveObject(with: ingredientData! as Data) as? [Ingredient])!
        }
    }
    
    func saveData(){
        let ingredientData = NSKeyedArchiver.archivedData(withRootObject: ingredients)
        myDefaults.set(ingredientData, forKey:ingredient_list)
    }
    
    
}

