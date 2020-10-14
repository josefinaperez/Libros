//
//  BookTableViewCell.swift
//  Libros
//
//  Created by Josefina Perez on 11/10/2020.
//  Copyright © 2020 Josefina Perez. All rights reserved.
//

import UIKit
import Kingfisher

class BookTableViewCell: UITableViewCell {

    @IBOutlet var lblTitle: UILabel!
    @IBOutlet var lblAuthor: UILabel!
    @IBOutlet var lblPopularity: UILabel!
    @IBOutlet var lblAvailability: UILabel!
    @IBOutlet var img: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    func configurar(book: Book){
        lblTitle.text = book.title
        lblAuthor.text = book.author
        lblPopularity.text = "Popularidad: \(String(book.popularity))"
        lblAvailability.text = "Disponible: \(book.availability ? "si" : "no")"
        
        let imageUrl = URL(string: book.image)
        imageView?.kf.setImage(with: imageUrl)
    }

}
