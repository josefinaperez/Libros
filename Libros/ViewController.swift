//
//  ViewController.swift
//  Libros
//
//  Created by Josefina Perez on 28/09/2020.
//  Copyright © 2020 Josefina Perez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        BookRepository.getBooks(completionHandler: { books, error in
            
            if let error = error{
                print(error)
            }
            
            else {
                print(books)
            }
            
            
        })
        
    }


}

