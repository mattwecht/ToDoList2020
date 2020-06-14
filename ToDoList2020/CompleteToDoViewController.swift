//
//  CompleteToDoViewController.swift
//  ToDoList2020
//
//  Created by Matthew Wecht on 5/3/20.
//  Copyright © 2020 Matthew Wecht. All rights reserved.
//

import UIKit

class CompleteToDoViewController: UIViewController {

    var previousVC = TableViewController()
    var selectedToDo : ToDoCD?
    
    @IBOutlet var titleLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = selectedToDo?.name

        // Do any additional setup after loading the view.
    }
    
    @IBAction func completeTapped(_ sender: Any) {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
          if let theToDo = selectedToDo {
            context.delete(theToDo)
            navigationController?.popViewController(animated: true)
          }
        }
    }

}
