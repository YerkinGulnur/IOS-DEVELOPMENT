//
//
//  FilmDetailsViewController.swift
//  TabbedFaves
//
//  Created by Гулнур  on 16.11.2024.
//

import UIKit

class FilmDetailsViewController: UIViewController {
    
    private var film: Film?

    @IBOutlet weak var filmImage: UIImageView!
    @IBOutlet weak var filmTitle: UILabel!
    @IBOutlet weak var filmDescription: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        filmTitle.text = film?.title
        filmDescription.text = film?.description
        filmImage.image = film?.poster
    }
    
    func configure(with model: Film?) {
        self.film = model
    }
    
}
