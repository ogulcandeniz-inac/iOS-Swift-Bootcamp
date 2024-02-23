//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

//
//  ViewController.swift
//  EggTimer
//
//  Created by Ogulcan Deniz Inac on 23/02/2024.
//  The tasks given in the bootcamp training by Ogulcan Deniz Inac were carried out.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var timer = Timer()
    var totalTime = 0
    var secondPassed = 0
    var player: AVAudioPlayer!
    @IBOutlet weak var proggesBar: UIProgressView!
    @IBOutlet weak var titleLabel: UILabel!
    
    let eggTimes = ["Soft": 3, "Medium":420, "Hard": 720]

    @IBAction func hardnessSelected(_ sender: UIButton) {
        timer.invalidate()
        let hardness = sender.currentTitle
        totalTime = eggTimes[hardness!]!
        proggesBar.progress = 0.0
        secondPassed = 0
        titleLabel.text = hardness
        timer =   Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    func playSound() {
        if let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3") {
            player = try! AVAudioPlayer(contentsOf: url)
            player.play()
        } else {
            print("Audio file not found.")
        }
    }
    
    @objc func updateTimer(){
        if secondPassed < totalTime{
            secondPassed += 1
            proggesBar.progress = Float(secondPassed) / Float(totalTime)
        }
        else{
            timer.invalidate()
            titleLabel.text = "Done"
            playSound()
        }
    }
}
