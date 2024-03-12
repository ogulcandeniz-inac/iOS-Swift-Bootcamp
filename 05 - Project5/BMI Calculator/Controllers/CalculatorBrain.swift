//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Oğulcan Deniz İnaç on 12.03.2024.
//  Copyright © 2024 Angela Yu. All rights reserved.
//

import Foundation
import UIKit

struct CalculatorBrain{
    var bmi: BMI?
    
    func getBMIValue() -> String{
        let bmiToDecimalPlace = String(format: "%.1f", bmi?.value ?? 0.0)
        return bmiToDecimalPlace
    }
   
    func getColor() -> UIColor {
        return bmi?.color ?? UIColor.blue
        }
    
    func getAdvice() -> String{
        return bmi?.advice ?? "No advice"
    }
    
    mutating func calculateBMI(height: Float, weight: Float){
        let bmiValue =  weight / (height * height)
        
        if bmiValue < 18.5{
            bmi = BMI(value: bmiValue, advice: "Eat more pies",  color: UIColor.blue)
        }
        else if bmiValue < 24.9{
            bmi = BMI(value: bmiValue, advice: "Fir as a fiddle!",  color: UIColor.orange)
        }
        else{
            bmi = BMI(value: bmiValue, advice: "Eat less pies!",  color: UIColor.red)
        }
    }
}
