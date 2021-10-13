//
//  ContentView.swift
//  HelloTodo
//
//  Created by Mohammad Azam on 10/13/21.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var todoListVM = TodoListViewModel()
    
    var body: some View {
        NavigationView {
            
            VStack {
               
                List {
                    ForEach(todoListVM.todoItems) { todoItem in
                        HStack {
                            Text(todoItem.title)
                            Spacer()
                            Text(todoItem.priority)
                        }
                    }.onDelete { indexSet in
                        indexSet.forEach { index in
                            let todoItem = todoListVM.todoItems[index]
                            todoListVM.deleteTodoItem(todoItem)
                        }
                    }
                }.onAppear(perform: {
                    todoListVM.populateTodos()
                })
                
                .navigationTitle("Todos")
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}}
