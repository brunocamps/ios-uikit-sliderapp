//
//  ViewController.swift
//  Bullseyeapp
//
//  Created by Bruno Campos on 4/5/22.
//

import UIKit

class ViewController: UIViewController {
    
    var currentValue = 0
    
    var targetValue = 0
    
    var score = 0
    var round = 0
    
    @IBOutlet var scoreLabel: UILabel!
    
    @IBOutlet var slider: UISlider!

    @IBOutlet var roundLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startNewRound()
    }
    
    @IBAction func showAlert() {

        
        let difference = abs(targetValue - currentValue)
        let points = 100 - difference
        
        score += points

        let message = "You scored \(points) points"
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
        currentValue = lroundf(slider.value)
    }
    
    @IBOutlet var targetLabel: UILabel!

    
    func startNewRound() {
      round += 1
      targetValue = Int.random(in: 1...100)
      currentValue = 50
      slider.value = Float(currentValue)
      updateLabels()
    }
    
    func updateLabels() {
      targetLabel.text = String(targetValue)
      scoreLabel.text = String(score)
      roundLabel.text = String(round)
        
    }
}

