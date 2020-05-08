//
//  ViewController.swift
//  todo
//
//  Created by Jody Abney on 5/7/20.
//  Copyright © 2020 AbneyAnalytics. All rights reserved.
//

import UIKit

class ToDoVC: UIViewController, UITableViewDataSource, UITableViewDelegate {

    //MARK: - IBOutlets
    
    @IBOutlet weak var todoItemText: UITextField!
    @IBOutlet weak var prioritySegment: UISegmentedControl!
    @IBOutlet weak var todoTable: UITableView!
    
    var todos = Array<ToDo>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        todoTable.delegate = self
        todoTable.dataSource = self
        
        getToDos()
                
    }
    
    //MARK: - Instance Methods
    
    func getToDos() {
        
        NetworkService.shared.getToDos(onSuccess: { (todos) in
            self.todos = todos.items
            self.todoTable.reloadData()
        }) { (errorMessage) in
            // show alert to user
            debugPrint(errorMessage)
        }
    }
    
    
    
    //MARK: - IBActions

    @IBAction func addToDo(_ sender: UIButton) {
        guard let todoItem = todoItemText.text else {
            // show error "you must enter a todo item"
            return
        }
        let todo = ToDo(item: todoItem, priority: prioritySegment.selectedSegmentIndex)
        NetworkService.shared.addToDo(todo: todo,
                                      onSuccess: { (todos) in
                                        self.todoItemText.text = ""
                                        self.todos = todos.items
                                        self.todoTable.reloadData()
        }) { (errorMessage) in
            // show any erros to user on POST
        }
    }
    
    
    //MARK: - TableView DataSource Methods
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoCell") as? ToDoCell {
            cell.upateCell(todo: todos[indexPath.row])
            return cell
        } else {
            return ToDoCell()
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}

