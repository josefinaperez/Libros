//
//  BookListPresenter.swift
//  Libros
//
//  Created by Josefina Perez on 13/10/2020.
//  Copyright © 2020 Josefina Perez. All rights reserved.
//

import Foundation

class BookListPresenter: BookListPresenterProtocol{
    var view: BookListViewProtocol?
    
    func getBooks() {
        BookRepository.getBooks(completionHandler: {
            books, error in
            
            if let error = error{
                self.view?.showError(error: error)
            }
            
            else{
                let sortedBooks = books.sorted(by: { $0.popularity > $1.popularity })
                self.view?.showBooks(books: sortedBooks)
            }
            
        })
    }
    
    
}
