//
//  ViewController.swift
//  SuperheroRandomizerApp
//
//  Created by Гулнур  on 22.11.2024.
//

import UIKit

struct Superhero: Decodable{
    let name: String
    let biography: Biography
    let powerstats: PowerStats
    let images: HeroImage
    
    struct Biography: Decodable {
        let fullName: String
        let placeOfBirth: String
    }
    
    struct PowerStats: Decodable {
        let intelligence: Int
        let strength: Int
        let speed: Int
        let durability: Int
        let power: Int
        let combat: Int
    }
    struct HeroImage: Decodable {
        let sm: String
        let md: String
    }
}

class ViewController: UIViewController {

    @IBOutlet private weak var heroImage: UIImageView!
    @IBOutlet private weak var heroTitle: UILabel!
    @IBOutlet private weak var heroDescription: UILabel!
    @IBOutlet private weak var intelligenceLabel: UILabel!
    @IBOutlet private weak var strengthLabel: UILabel!
    @IBOutlet private weak var speedLabel: UILabel!
    @IBOutlet private weak var durabilityLabel: UILabel!
    @IBOutlet private weak var powerLabel: UILabel!
    @IBOutlet private weak var combatLabel: UILabel!
    @IBOutlet private weak var placeOfBirthLabel: UILabel!
    
    @IBOutlet weak var randomizeButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        randomizeButton.layer.cornerRadius = 10
        randomizeButton.layer.masksToBounds = true
        // Do any additional setup after loading the view.
    }

    @IBAction func heroRollDidTap(_ sender: UIButton) {
        let randomId = Int.random(in: 1...563)
        fetchHero(by: randomId)
    }
    private func fetchHero(by id: Int){
        let urlString = "https://akabab.github.io/superhero-api/api/id/\(id).json"
        guard let url  = URL(string: urlString) else {return}
        let urlRequest = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: urlRequest){ data, response, error in
            if let error = error {
                print("Error fetching hero data: \(error.localizedDescription)")
                return
            }
            guard let data else{return}
            self.handleHeroData(data: data)
        }.resume()
    }
    private func handleHeroData(data: Data){
        do{
            let hero = try JSONDecoder().decode(Superhero.self, from: data)
            let heroImage = self.getImageFromUrl(string: hero.images.sm)
            
            DispatchQueue.main.async {
                self.heroTitle.text = hero.name
                self.heroDescription.text = hero.biography.fullName
                self.intelligenceLabel.text = "Intelligence: \(hero.powerstats.intelligence)"
                self.strengthLabel.text = "Strength: \(hero.powerstats.strength)"
                self.speedLabel.text = "Speed: \(hero.powerstats.speed)"
                self.durabilityLabel.text = "Durability: \(hero.powerstats.durability)"
                self.powerLabel.text = "Power: \(hero.powerstats.power)"
                self.combatLabel.text = "Combat:\(hero.powerstats.combat)"
                self.placeOfBirthLabel.text = "Place of Birth: \(hero.biography.placeOfBirth)"
                self.heroImage.image = heroImage
            }
        }catch {
            DispatchQueue.main.async {
                self.heroTitle.text = error.localizedDescription + "\nReRoll again!"
                self.heroDescription.text = ""
                self.intelligenceLabel.text = ""
                self.strengthLabel.text = ""
                self.speedLabel.text = ""
                self.durabilityLabel.text = ""
                self.powerLabel.text = ""
                self.combatLabel.text = ""
                self.placeOfBirthLabel.text = ""

                self.heroImage.image = nil
            }
        }
    }
    
    private func getImageFromUrl(string: String) -> UIImage? {
        guard
            let heroImageURL = URL(string: string),
            let imageData = try? Data(contentsOf: heroImageURL)
        else {
            return nil
        }
        return UIImage(data: imageData)
    }

    private func handleErrorIfNeeded(error: Error?) -> Bool {
        guard let error else {
            return false
        }
        print(error.localizedDescription)
        return true
    }
}

