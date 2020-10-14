//
//  ExtensionVC.swift
//  Libros
//
//  Created by Josefina Perez on 13/10/2020.
//  Copyright © 2020 Josefina Perez. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController{
    func showAlertError(error: Error){
        let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
        
        
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        
        self.present(alert, animated: true)
    }
}
