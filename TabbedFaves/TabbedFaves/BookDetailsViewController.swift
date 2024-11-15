//
//
//  BookDetailsViewController.swift
//  TabbedFaves
//
//  Created by Гулнур  on 16.11.2024.
//

import UIKit

class BookDetailsViewController: UIViewController {
    
    private var book: Book?
    
    @IBOutlet weak var bookImage: UIImageView!
    @IBOutlet weak var bookTitle: UILabel!
    @IBOutlet weak var bookDescription: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bookTitle.text = book?.title
        bookDescription.text = book?.description
        bookImage.image = book?.poster
    }
    
    func configure(with model: Book?) {
        self.book = model
    }
    
}
