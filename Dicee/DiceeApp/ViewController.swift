//
//  ViewController.swift
//  DiceeApp
//
//  Created by Балжан Бозбашава on 04.10.2024.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var DiceImageViewOne: UIImageView!
    @IBOutlet weak var DiceImageViewTwo: UIImageView!

    let diceArray = [ #imageLiteral(resourceName: "dice1"),#imageLiteral(resourceName: "dice2"),#imageLiteral(resourceName: "dice3"),#imageLiteral(resourceName: "dice4"),#imageLiteral(resourceName: "dice5"),#imageLiteral(resourceName: "dice6")]
    
    
    @IBAction func rollButtonPressed(_ sender: UIButton) {
        DiceImageViewOne.image = diceArray.randomElement()
        DiceImageViewTwo.image = diceArray.randomElement()
    }
    
}

