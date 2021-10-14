//
//  Constants.swift
//  HelloTodo
//
//  Created by Mohammad Azam on 10/13/21.
//

import Foundation

struct Constants {
    
    struct Urls {
        
        static let allTodosURL = URL(string: "https://warp-wiry-rugby.glitch.me/todos")!
        static let createTodoURL = URL(string: "https://warp-wiry-rugby.glitch.me/todos")!
        
        static func deleteTaskURL(_ taskId: Int) -> URL {
            return URL(string: "https://warp-wiry-rugby.glitch.me/todos/\(taskId)")!
        }
    }
    
    
}
