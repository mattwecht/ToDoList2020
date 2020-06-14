//
//  AddToDoViewController.swift
//  ToDoList2020
//
//  Created by Matthew Wecht on 5/3/20.
//  Copyright © 2020 Matthew Wecht. All rights reserved.
//

import UIKit
import CoreData

class AddToDoViewController: UIViewController {
    var previousVC = TableViewController()


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var importantSwitch: UISwitch!
    
    @IBAction func addTapped(_ sender: Any) {
        // we have to grab this view context to be able to work with Core Data
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {

          // we are creating a new ToDoCD object here, naming it toDo
          let toDo = ToDoCD(entity: ToDoCD.entity(), insertInto: context)

          // if the titleTextField has text, we will call that text titleText
          if let titleText = titleTextField.text {
              // we will take the titleText and assign that value to toDo.name
              // this .name and .important came from the attributes you typed in on the Core Data page!
              toDo.name = titleText
              toDo.important = importantSwitch.isOn
          }

          try? context.save()//core data function
        
        navigationController?.popViewController(animated: true)//send back

        }}
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
