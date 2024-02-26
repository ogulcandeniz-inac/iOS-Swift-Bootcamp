//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
  
    let quiz: [(question: String, answer: Bool)] = [
            ("Four + two is equal to Six", true),
            ("Five - Three is greater than One", true),
            ("Three + Eight is less than Ten", false)
        ]
    
    var questionNumber = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
       updateUI()
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
    
        let userAnswer = sender.currentTitle
        let actualAnswer = quiz[questionNumber].1
        
        if (userAnswer != nil) == actualAnswer{
            print("Right!")
        }
        else {
            print("Wrong!")
        }
        
        if questionNumber + 1 < quiz.count{
           questionNumber += 1
        }
        else {
            questionNumber = 0
        }
        
        updateUI()
    }
    
    
    func updateUI(){
        questionLabel.text = quiz[questionNumber].0
    }
    
    
}

