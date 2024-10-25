import UIKit

class BookTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var coverImageView: UIImageView!
    
    func configure(with book: Book) {
        titleLabel.text = book.title
        authorLabel.text = book.author
        genreLabel.text = book.genre
        coverImageView.image = book.cover
    }
}
