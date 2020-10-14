//
//  BookListViewController.swift
//  Libros
//
//  Created by Josefina Perez on 11/10/2020.
//  Copyright © 2020 Josefina Perez. All rights reserved.
//

import UIKit



class BookListViewController: UIViewController, BookListViewProtocol {
    var presenter: BookListPresenterProtocol?
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var btnSort: UIButton!
    @IBOutlet var btnAvailabel: UIButton!
    @IBOutlet var btnNotAvailable: UIButton!
    @IBOutlet var btnShowAll: UIButton!
    
    let alert = UIAlertController(title: "Bienvenido a la biblioteca de Ualá", message: nil, preferredStyle: .alert)
    var books: [Book] = []
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Biblioteca Ualá"
        
        presenter = BookListPresenter()
        presenter?.view = self
        presenter?.getBooks()
         
        //cartel bienvenida
        self.present(alert, animated: true)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        
        btnSort.setTitle("Ordenar", for: .normal)
        btnAvailabel.setTitle("Disponibles", for: .normal)
        btnNotAvailable.setTitle("No disponibles", for: .normal)
        btnShowAll.setTitle("Ver todo", for: .normal)
        
    }
    
    func showError(error: Error) {
        showAlertError(error: error)
    }
    
    func showBooks(books: [Book]) {
        self.books = books
        tableView.reloadData()
    }
    
    @IBAction func sort() {
        presenter?.sortBooks()
    }
    
    @IBAction func showAvailable(){
        presenter?.showAvailable()
    }
    
    @IBAction func showNotAvailable(){
        presenter?.showNotAvailable()
    }
    
    @IBAction func showAll(){
        presenter?.showAll()
    }
}

extension BookListViewController: UITableViewDelegate, UITableViewDataSource{
func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return books.count
}

func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? BookTableViewCell
    
    cell?.configurar(book: books[indexPath.row])
    
    return cell ?? UITableViewCell()
}
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 158.0
        
    }
    
}

