//
//  TodoListViewModel.swift
//  HelloTodo
//
//  Created by Mohammad Azam on 10/13/21.
//

import Foundation

class TodoListViewModel: ObservableObject {
    
    @Published var todoItems = [TodoItemViewModel]()
    
    func deleteTodoItem(_ todoItem: TodoItemViewModel) {
        
        Webservice().deleteTodoItem(url: Constants.Urls.deleteTaskURL(todoItem.id)) { result in
           
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
   
    var id: Int {
        todo.id
    }
    
    var title: String {
        todo.title
    }
    
    var priority: String {
        todo.priority.uppercased()
    }
    
}
