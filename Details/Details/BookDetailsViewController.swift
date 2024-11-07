//
//  BookDetailsViewController.swift
//  collection
//
//  Created by Гулнур  on 07.11.2024.
//
import UIKit

class BookDetailsViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var coverImageView: UIImageView!
    
    var selectedBook: Book? // This will hold the book data passed from the main view
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Set the data for the labels and image view
        if let book = selectedBook {
            titleLabel.text = book.title
            authorLabel.text = book.author
            genreLabel.text = book.genre
            descriptionLabel.text = "Description goes here"  // You can add more description if needed
            coverImageView.image = book.cover
        }
    }
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}

