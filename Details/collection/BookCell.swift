//
//  Movies.swift
//  collection
//
//  Created by Гулнур  on 08.11.2024.
//

import UIKit
protocol MangasCellDelegate: AnyObject {
    func didTapButton(with book: Book)
}
class Movies: UITableViewCell {
    @IBOutlet weak var coverImage: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var genre: UILabel!
    @IBOutlet weak var showDescriptionButton: UIButton!
    
    weak var delegate: MangasCellDelegate?
    private var book: Book?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configure(with book: Book) {
        self.book = book  
        coverImage.image = book.cover
        title.text = book.title
        descriptionLabel.text = book.author
        genre.text = book.genre
    }
    @IBAction func showDescriptionTapped(_ sender: UIButton) {
        guard let book = book else { return }
        delegate?.didTapButton(with: book)
    }
}
