//
//  BookListProtocols.swift
//  Libros
//
//  Created by Josefina Perez on 13/10/2020.
//  Copyright © 2020 Josefina Perez. All rights reserved.
//

import Foundation

protocol BookListViewProtocol{
    var presenter: BookListPresenterProtocol? {get set}
    func showError(error: Error)
    func showBooks(books: [Book])
}

protocol BookListPresenterProtocol{
    var view: BookListViewProtocol? {get set}
    func getBooks()
    func sortBooks()
}
