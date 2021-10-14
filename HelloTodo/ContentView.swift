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
               
                TextField("Enter title", text: $todoListVM.todoTitle)
                    .textFieldStyle(.roundedBorder)
                
                Picker("Priority", selection: $todoListVM.selectedPriority) {
                    Text("Low").tag("low")
                    Text("Medium").tag("medium")
                    Text("High").tag("high")
                }.pickerStyle(.segmented)
                
                Button("Add Task") {
                    todoListVM.createTodoItem()
                }.padding(.top, 10)
                
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
            
            }.padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}}
