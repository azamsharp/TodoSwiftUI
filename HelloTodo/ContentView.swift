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
                List(todoListVM.todoItems) { todoItem in
                    Text(todoItem.title)
                }
            }.onAppear {
                todoListVM.populateTodos()
            }
            .navigationTitle("Todos")
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
