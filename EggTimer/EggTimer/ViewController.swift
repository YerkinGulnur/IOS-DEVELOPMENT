//
//  ViewController.swift
//  EggTimer
//
//   Created by Гулнур  on 20.10.2024.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    let eggTimes: [String: Int] = ["Soft": 3, "Medium": 5, "Hard": 7]
    var totalTime = 0
    var secondsPassed = 0
    var timer = Timer()
    var player: AVAudioPlayer!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func eggButtonPressed(_ sender: UIButton) {
        timer.invalidate()
        
        guard
            let eggTitle = sender.title(for: .normal),
            let overallTime = eggTimes[eggTitle]
        else {
            return
        }
        
        totalTime = overallTime
        secondsPassed = 0
        progressBar.progress = 0.0
        titleLabel.text = "\(totalTime) seconds"
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    @objc func updateTimer() {
        if secondsPassed < totalTime {
            secondsPassed += 1
            progressBar.progress = Float(secondsPassed) / Float(totalTime)
            titleLabel.text = "\(totalTime - secondsPassed) seconds"
        } else {
            timer.invalidate()
            titleLabel.text = "DONE!"
            playSound()
        }
    }
    func playSound() {
        guard
            let soundUrl = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        else {
            return
        }
        
        do {
            player = try AVAudioPlayer(contentsOf: soundUrl)
                  player?.play()
        } catch {
            print("Error playing sound: \(error)")
        }
    }
}
