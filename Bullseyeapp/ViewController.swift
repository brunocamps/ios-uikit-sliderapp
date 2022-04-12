//
//  ViewController.swift
//  Bullseyeapp
//
//  Created by Bruno Campos on 4/5/22.
//

import UIKit

class ViewController: UIViewController {
    
    var currentValue: Int = 50
    
    var targetValue = 0
    
    
    @IBOutlet var slider: UISlider!


    override func viewDidLoad() {
        super.viewDidLoad()
//        currentValue = lroundf(slider.value)
//        targetValue = Int.random(in: 1...100)
        
        startNewRound()
    }
    
    @IBAction func showAlert() {
        
        //var difference: Int
        
//        if currentValue > targetValue {
//            difference = currentValue - targetValue
//        } else if targetValue > currentValue {
//            difference = targetValue - currentValue
//        } else {
//            difference = 0
//        }
        
        var difference = currentValue - targetValue
        if difference < 0 {
            difference = difference * -1
        }
        
        
        let message = "The value of the slider is: \(currentValue)" +
        "\nThe target value is: \(String(describing: targetValue))" +
        "\nThe difference is: \(difference)"

        let alert = UIAlertController(
          title: "Hello, World",
          message: message,    // changed
          preferredStyle: .alert)

        let action = UIAlertAction(
          title: "OK",          // changed
          style: .default,
          handler: nil)

        alert.addAction(action)

        present(alert, animated: true, completion: nil)
        
        startNewRound() // code reuse with a function
    }
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        // print("The value of the slider is now: \(slider.value)")
        currentValue = lroundf(slider.value)
    }
    
    @IBOutlet var targetLabel: UILabel!

    
    func startNewRound() {
      targetValue = Int.random(in: 1...100)
      currentValue = 50
      slider.value = Float(currentValue)
      updateLabels()
    }
    
    func updateLabels() {
      targetLabel.text = String(targetValue)
    }
}

