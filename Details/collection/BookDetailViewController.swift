//
//  BookDetailViewController.swift
//  collection
//
//  Created by Гулнур  on 08.11.2024.
//

import UIKit


class BookDetailViewController: UIViewController {
    @IBOutlet weak var descriptionLabel: UILabel!
    var book: Book?

    override func viewDidLoad() {
        super.viewDidLoad()
        descriptionLabel.text = book?.description
      
    }
//    func didTapButton(with book: Book) {
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        if let detailVC = storyboard.instantiateViewController(withIdentifier: "BookDetailViewController") as? BookDetailViewController {
//            detailVC.book = book  // Передача книги
//            navigationController?.pushViewController(detailVC, animated: true)
//        }
//    }

}

