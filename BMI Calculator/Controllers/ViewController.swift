//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightSilder: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    var calculatorBrain = CalculatorBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    

    @IBAction func heightSliderPressed(_ sender: UISlider) {
        
        let height = String(format: "%.2f", sender.value)
        heightLabel.text! = "\(height)m"
    }
    
    
    @IBAction func weightSliderPressed(_ sender: UISlider) {
        let weight = String(format: "%.0f", sender.value)
        weightLabel.text! = "\(weight)Kg"
        
    }
    @IBAction func calculateButtonPressed(_ sender: UIButton) {
        
        let height = heightSilder.value
        let weight = weightSlider.value
        
        calculatorBrain.calculateBmiValue(height: height, weight: weight)
        
        self.performSegue(withIdentifier: "CalculatetoBmiResult", sender: nil)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "CalculatetoBmiResult" {
            
            let destinationVC = segue.destination as! BmiResultViewController
            destinationVC.bmiValue = calculatorBrain.getBmiValue()
            destinationVC.advice = calculatorBrain.getAdvice()
            destinationVC.color = calculatorBrain.getColor()
        }
    }
    
}

