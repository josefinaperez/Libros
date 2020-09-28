//
//  BookRepository.swift
//  Libros
//
//  Created by Josefina Perez on 28/09/2020.
//  Copyright © 2020 Josefina Perez. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class BookRepository {
    
   static func getBooks(completionHandler: @escaping (_ books: [Book], _ error: Error?) -> Void){
        
        let urlString = "https://qodyhvpf8b.execute-api.us-east-1.amazonaws.com/test/books"
        
        AF.request(urlString).validate().responseJSON(completionHandler: { response in
            
            if let error = response.error{
                print(error.errorDescription)
                completionHandler([], error)
            }
            
            else if let value = response.value{
                var json = JSON(value)
                
                var jsonBooks = json.arrayValue
                var books: [Book] = []
                
                for jsonBook in jsonBooks{
                    let book = Book(json: jsonBook)
                    books.append(book)
                }
                
                completionHandler(books, nil)
                
                
            }
            
        })
        
    }
    
}
