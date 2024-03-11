//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {
    
    var bmiValue = "0.0"
    
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    @IBAction func heightSliderChangedd(_ sender: UISlider) {
        print(String(format: "%.2f", sender.value))
        let height = String(format: "%.2f", sender.value)
        heightLabel.text = "\(height) m"
    }
    @IBAction func weightSliderChangedd(_ sender: Any) {
        if let slider = sender as? UISlider {
            print(Int(slider.value))
            let weight = String(Int(slider.value))
            weightLabel.text = "\(weight) kg"
        }
    }
    
    @IBAction func calculatePressedd(_ sender: UIButton) {
        let height = heightSlider.value
        let weight = weightSlider.value
        let bmi = weight / (height * height)
        bmiValue = String(format: "%.1f", bmi)
        print(bmi)
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
}
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult"{
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.bmiValue = bmiValue
        }
    }
    
    
}
