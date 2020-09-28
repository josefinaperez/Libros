//
//  Book.swift
//  Libros
//
//  Created by Josefina Perez on 28/09/2020.
//  Copyright © 2020 Josefina Perez. All rights reserved.
//

import Foundation
import SwiftyJSON

class Book {
    var id: Int
    var author: String
    var title: String
    var availability: Bool
    var image: String
    var popularity: Int
    
    init(json: JSON) {
        self.id = json["id"].intValue
        self.author = json["autor"].stringValue
        self.title = json["nombre"].stringValue
        self.availability = json["disponibilidad"].boolValue
        self.image = json["imagen"].stringValue
        self.popularity = json["popularidad"].intValue
        
    }
    
}
