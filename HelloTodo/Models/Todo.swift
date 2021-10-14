//
//  Todo.swift
//  HelloTodo
//
//  Created by Mohammad Azam on 10/13/21.
//

import Foundation

struct Todo: Codable {
    var id: Int?
    let title: String
    let priority: String
}
