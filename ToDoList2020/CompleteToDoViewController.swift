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
    var selectedToDo = ToDo()
    
    @IBOutlet var titleLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = selectedToDo.name

        // Do any additional setup after loading the view.
    }
    
    @IBAction func completeTapped(_ sender: Any) {
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
