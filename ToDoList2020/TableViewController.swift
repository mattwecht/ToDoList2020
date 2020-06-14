//
//  TableViewController.swift
//  ToDoList2020
//
//  Created by Matthew Wecht on 5/2/20.
//  Copyright © 2020 Matthew Wecht. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    var toDos : [ToDoCD] = [] // create an empty array of type ToDoCD

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        getToDos()//reads core data
    }

    // MARK: - Table view data source
    
    func getToDos() {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            if let coreDataToDos = try? context.fetch(ToDoCD.fetchRequest()) as? [ToDoCD] {
                    toDos = coreDataToDos
                    tableView.reloadData()
        }
        
        }}
    
//    func createToDo() -> [ToDo] {
//
//        let cake = ToDo()
//        cake.name = "Eat some cake"
//        cake.important = true
//
//        let dog = ToDo()
//        dog.name = "Get another dog"
//      // important is set to false by default
//
//        return [cake, dog]
//    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return toDos.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        let toDo = toDos[indexPath.row]
        if let name = toDo.name {
          if toDo.important {
              cell.textLabel?.text = "❗️" + name
          } else {
              cell.textLabel?.text = toDo.name
          }
        }

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let toDo = toDos[indexPath.row]
        
        performSegue(withIdentifier: "moveToComplete", sender: toDo)
    }


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      if let addVC = segue.destination as? AddToDoViewController {
        addVC.previousVC = self
      }
        
        if let completeVC = segue.destination as? CompleteToDoViewController{
            if let toDo = sender as? ToDoCD{
                completeVC.selectedToDo = toDo
                completeVC.previousVC = self
            }
        }
    }

}
