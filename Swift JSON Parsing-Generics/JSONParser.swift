//
//  JSONParser.swift
//  Swift JSON Parsing-Generics
//
//  Created by shiga on 28/10/19.
//  Copyright © 2019 Shigas. All rights reserved.
//

import Foundation

enum DataError: Error {
    case invalidResponse
    case invalidData
    case decodingError
    case serverError
}


class JSONParser {

    // :- Step - 1
    typealias result<T> = (Result<[T], Error>) -> Void
    
    // :- Step - 2
    func downloadList<T: Decodable
        >(of type: T.Type, from url: URL, completion: @escaping result<T>) {
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let error = error {
                completion(.failure(error))
            }
            
            guard let response = response as? HTTPURLResponse else {
                completion(.failure(DataError.invalidResponse))
                return
            }
            
            if 200 ... 299 ~= response.statusCode {
                if let data = data {
                    do {
                        let decodeData: [T] = try JSONDecoder().decode([T].self, from: data)
                        completion(.success(decodeData))
                        
                    } catch  {
                        completion(.failure(DataError.invalidData))
                    }
                } else {
                    completion(.failure(DataError.serverError))
                }
            }
            
        }.resume()
    }
    
    
}
