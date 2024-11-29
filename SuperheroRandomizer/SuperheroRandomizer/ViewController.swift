//
//  ViewController.swift
//  SuperheroRandomizer
//
//  Created by Гулнур  on 29.11.2024.
//

import UIKit
import Alamofire
import Kingfisher

class ViewController: UIViewController, NetworkManagerDelegate {
    
    private var networkManager = NetworkManager()
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var intelligenceLabel: UILabel!
    @IBOutlet weak var strengthLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var occupationLabel: UILabel!
    @IBOutlet weak var durabilityLabel: UILabel!
    @IBOutlet weak var powerLabel: UILabel!
    @IBOutlet weak var randomizeButton: UIButton!
    
    var superheroes: [Superhero] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        networkManager.delegate = self
        networkManager.fetchSuperheroes()

        randomizeButton.layer.cornerRadius = 10
        randomizeButton.layer.masksToBounds = true
    }

    @IBAction func randomizeTapped(_ sender: UIButton) {
        displayRandomHero()
    }
    
    func onHeroDidFetch(_ hero: [Superhero]) {
        self.superheroes = hero
        displayRandomHero()
    }

    func  displayRandomHero(){
        guard !superheroes.isEmpty else { return }
        
        guard let randomHero = superheroes.randomElement() else { return }
        
        if let imageURL = URL(string: randomHero.images.lg){
            self.imageView.kf.setImage(with: imageURL)
        }
        
        DispatchQueue.main.async {
            self.nameLabel.text = "Name: \(randomHero.name)"
            self.fullNameLabel.text = "Full Name: \(randomHero.biography.fullName)"
            self.intelligenceLabel.text = "Intelligence: \(randomHero.powerstats.intelligence)"
            self.strengthLabel.text = "Strength: \(randomHero.powerstats.strength)"
            self.speedLabel.text = "Speed: \(randomHero.powerstats.speed)"
            self.genderLabel.text = "Gender: \(randomHero.appearance.gender)"
            self.occupationLabel.text = "Occupation: \(randomHero.work.occupation)"
            self.durabilityLabel.text = "Durability: \(randomHero.powerstats.durability)"
            self.powerLabel.text = "Power: \(randomHero.powerstats.power)"
        }
    
    }
}

