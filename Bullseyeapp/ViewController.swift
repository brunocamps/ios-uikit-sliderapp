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
        var points = 100 - difference
        
        
        // establish alert title
        let title: String
        
        if difference == 0 {
            title = "Perfect!"
            points += 100
        } else if difference < 5 {
            title = "You almost had it!"
            if difference == 1 {
                points += 50
            }
        } else if difference < 10 {
            title = "Pretty good!"
        } else {
            title = "Not even close..."
        }
        score += points

        let message = "You scored \(points) points"
        let alert = UIAlertController(
          title: title,
          message: message,    // changed
          preferredStyle: .alert)

        let action = UIAlertAction(
          title: "OK",          // changed
          style: .default,
          handler: { _ in
              self.startNewRound()
          })

        alert.addAction(action)

        present(alert, animated: true, completion: nil)
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

