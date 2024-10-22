//
//  ViewController.swift
//  EggTimer
//
//   Created by Гулнур  on 21.10.2024.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    let eggTimes: [String: Int] = ["Soft": 3, "Medium": 5, "Hard": 7]
    
    private var  player: AVAudioPlayer?
    private var timer = Timer()
    private var totalTime = 0
    private var secondsPassed = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
   
    @IBAction func sofEggTapped(_ sender: UITapGestureRecognizer) {
        startTimer(eggType: "Soft")
    }
    @IBAction func mediumEggTapped(_ sender: UITapGestureRecognizer) {
        startTimer(eggType: "Medium")
    }
    @IBAction func hardEggTapped(_ sender: UITapGestureRecognizer) {
        startTimer(eggType: "Hard")
    }
    
    func startTimer(eggType: String) {
            timer.invalidate()
            
            totalTime = eggTimes[eggType]!
            progressBar.progress = 0.0
            secondsPassed = 0
            titleLabel.text = eggType
            
            //запуск нового таймера
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        }
    
    @objc func updateTimer() {
           if secondsPassed < totalTime {
               secondsPassed += 1
               progressBar.progress = Float(secondsPassed) / Float(totalTime)
           } else {
               timer.invalidate()
               titleLabel.text = "DONE"
               playSound()
           }
       }
    
    func playSound() {
            let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
            player?.play()
        }
    
    
    
    
}

