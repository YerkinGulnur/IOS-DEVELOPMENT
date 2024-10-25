//
//  ViewController.swift
//  Xylophone
//
//  Created by Гулнур  on 18.10.2024.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    var audioPlayer: AVAudioPlayer?
    func playSound(note: String) {
        if let url = Bundle.main.url(forResource: note, withExtension: "wav") {
            do {
                audioPlayer?.stop()
                audioPlayer = try AVAudioPlayer(contentsOf: url)
                audioPlayer?.play()
            } catch {
                print("Error playing sound.")
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func noteCPressed(_ sender: UIButton) {
        playSound(note: "A")
    }

    @IBAction func noteDPressed(_ sender: UIButton) {
        playSound(note: "B")
    }
    @IBAction func noteEPressed(_ sender: UIButton) {
        playSound(note: "C")
    }

    @IBAction func noteFPressed(_ sender: UIButton) {
        playSound(note: "D")
    }
    @IBAction func noteGPressed(_ sender: UIButton) {
        playSound(note: "E")
    }

    @IBAction func noteAPressed(_ sender: UIButton) {
        playSound(note: "F")
    }
    @IBAction func noteBPressed(_ sender: UIButton) {
        playSound(note: "G")
    }

    }
