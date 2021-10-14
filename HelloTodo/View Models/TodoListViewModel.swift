//
//  TodoListViewModel.swift
//  HelloTodo
//
//  Created by Mohammad Azam on 10/13/21.
//

import Foundation

class TodoListViewModel: ObservableObject {
    
    @Published var todoTitle: String = ""
    @Published var selectedPriority: String = "medium"
    
    @Published var todoItems = [TodoItemViewModel]()
    
    func createTodoItem() {
        
        let todo = Todo(title: todoTitle, priority: selectedPriority)
        Webservice().createTodoItem(url: Constants.Urls.createTodoURL, todo: todo) { result in
            switch result {
                case .success(let response):
                    if let response = response {
                        if response.success {
                            self.populateTodos()
                        }
                    }
                case .failure(let error):
                    print(error.localizedDescription)
            }
        }
        
    }
    
    func deleteTodoItem(_ todoItem: TodoItemViewModel) {
        
        guard let todoItemId = todoItem.id else {
            return
        }
        
        Webservice().deleteTodoItem(url: Constants.Urls.deleteTaskURL(todoItemId)) { result in
           
            switch result {
                case .success(let response):
                    if let response = response {
                        if response.success {
                            self.populateTodos()
                        }
                    }
                case .failure(let error):
                    print(error)
                    
            }
            
        }
    }
    
    func populateTodos() {
        
        Webservice().getAllTodos(url: Constants.Urls.allTodosURL) { result in
            switch result {
                case .success(let todos):
                    DispatchQueue.main.async {
                        self.todoItems = todos.map(TodoItemViewModel.init)
                    }
                case .failure(let error):
                    print(error.localizedDescription)
            }
        }
        
    }
}

struct TodoItemViewModel: Identifiable {
    
    private let todo: Todo
    
    init(todo: Todo) {
        self.todo = todo
    }
   
    var id: Int? {
        todo.id
    }
    
    var title: String {
        todo.title
    }
    
    var priority: String {
        todo.priority.uppercased()
    }
    
}
