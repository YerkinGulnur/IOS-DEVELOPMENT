//
//
//  MusicDetailsViewController.swift
//  TabbedFaves
//
//  Created by Гулнур  on 16.11.2024.
//


import UIKit

class MusicDetailsViewController: UIViewController {

    private var music: Music?

    @IBOutlet weak var musicImage: UIImageView!
    @IBOutlet weak var musicTitle: UILabel!
    @IBOutlet weak var musicDescription: UILabel!
       

    override func viewDidLoad() {
        super.viewDidLoad()

        musicTitle.text = music?.title
        musicDescription.text = music?.description
        musicImage.image = music?.poster
    }
       
    func configure(with model: Music?) {
        self.music = model
    }

}
