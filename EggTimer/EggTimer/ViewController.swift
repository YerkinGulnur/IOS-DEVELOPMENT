//
//  SceneDelegate.swift
//  EggTimer
//
//   Created by Гулнур  on 20.10.2024.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    let eggTimes: [String: Int] = ["Soft": 3, "Medium": 4, "Hard": 5]
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var progressBar: UIProgressView!
    private var player: AVPlayer?
    private var timer: Timer?
    private var timeCounter: Int = 0
    private var overallTime: Int = 0
    @IBOutlet weak var softEggButton: UIButton!
    @IBOutlet weak var mediumEggButton: UIButton!
    @IBOutlet weak var hardEggButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = "How do you like your eggs?"
        progressBar.progress = 0.0
        
        softEggButton.setTitle("Soft", for: .normal)
        mediumEggButton.setTitle("Medium", for: .normal)
        hardEggButton.setTitle("Hard", for: .normal)
    }
    
    @IBAction func eggButtonDidTap(_ sender: UIButton) {
        guard let eggTitle = sender.title(for: .normal),
              let overallTime = eggTimes[eggTitle] else {
            return
        }
        
        timeCounter = 0
        timer?.invalidate()
        titleLabel.text = eggTitle
        progressBar.progress = 0.0
        
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { timer in
            self.timeCounter += 1
            DispatchQueue.main.async {
                self.progressBar.progress = Float(self.timeCounter) / Float(overallTime)
            }

            if self.timeCounter == overallTime {
                timer.invalidate()
                DispatchQueue.main.async {
                    self.titleLabel.text = "Egg is ready!"
                }
                self.playAlarmSound()
            }
        })
    }

    private func playAlarmSound() {
        guard let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3") else { return }
        player = AVPlayer(url: url)
        player?.play()
    }
}
