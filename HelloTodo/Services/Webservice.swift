//
//  Webservice.swift
//  HelloTodo
//
//  Created by Mohammad Azam on 10/13/21.
//

import Foundation

enum NetworkError: Error {
    case decodingError
    case badRequest
}

class Webservice {
    
    func getAllTodos(url: URL, completion: @escaping (Result<[Todo], NetworkError>) -> Void) {
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data, error == nil,
                  (response as? HTTPURLResponse)?.statusCode == 200 else {
                      completion(.failure(.badRequest))
                      return
                  }
            
            let todos = try? JSONDecoder().decode([Todo].self, from: data)
            completion(.success(todos ?? []))
        }.resume()
        
    }
    
}
