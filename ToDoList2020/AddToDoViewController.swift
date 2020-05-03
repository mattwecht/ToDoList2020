//
//  AddToDoViewController.swift
//  ToDoList2020
//
//  Created by Matthew Wecht on 5/3/20.
//  Copyright © 2020 Matthew Wecht. All rights reserved.
//

import UIKit

class AddToDoViewController: UIViewController {
    var previousVC = TableViewController()


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var importantSwitch: UISwitch!
    
    @IBAction func addTapped(_ sender: Any) {
        let toDo = ToDo()

        if let titleText = titleTextField.text {
          toDo.name = titleText
          toDo.important = importantSwitch.isOn
        }
        previousVC.toDos.append(toDo)
        previousVC.tableView.reloadData()
        
        navigationController?.popViewController(animated: true)//send back

    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
