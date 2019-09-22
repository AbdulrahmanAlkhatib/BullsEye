//
//  ViewController.swift
//  BullsEye
//
//  Created by Abdulrahman Alkhatib on 13.08.2019.
//  Copyright © 2019 Abdulrahman Alkhatib. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    var currentValue = 0
    var targetValue = 0
    var score = 0
    var round = 0
    
    @IBOutlet weak var targetLabel: UILabel!
    
    @IBOutlet weak var slider: UISlider!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var roundLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentValue = Int(slider.value.rounded())
        startNewGame()
        
        let thumbImageNormal = #imageLiteral(resourceName: "SliderThumb-Normal")
        slider.setThumbImage(thumbImageNormal, for: .normal)
        
        let thumbImageHighlighted = #imageLiteral(resourceName: "SliderThumb-Highlighted")
        slider.setThumbImage(thumbImageHighlighted, for: .highlighted)
        
        let insets = UIEdgeInsets(top: 0, left: 14
            , bottom: 0
            , right: 14)
        
        let trackLeftImage = #imageLiteral(resourceName: "SliderTrackLeft")
        let trackLeftResizable = trackLeftImage.resizableImage(withCapInsets: insets)
        slider.setMinimumTrackImage(trackLeftResizable, for: .normal)
        
        let trackRightImage = #imageLiteral(resourceName: "SliderTrackRight")
        let trackRightResizable = trackRightImage.resizableImage(withCapInsets: insets)
        slider.setMaximumTrackImage(trackRightResizable, for: .normal)

    }
    
    @IBAction func showAlert(){
        
        let difference: Int
        difference = abs(targetValue - currentValue)
        
        var points : Int
        points = 100 - difference
        
        if difference == 0 {
            points += 100
        } else if difference == 1{
            points += 50
        }
        
        score += points

        
        let message = "you scored \(points) points"
        
        let title : String
        if difference ==  0 {
            title = "Excellent!"
        }else if difference <= 5 {
            title = "Very close!"
        }else if difference <= 10 {
            title = "Pretty close!"
        } else {
            title = "Not even close!"
        }
        
        let alert = UIAlertController(title: title , message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default, handler: {
            action in self.startNewRound()
        })
        alert.addAction(action)
        present(alert,animated: true, completion: nil)
        
        //startNewRound()
    }
    
    @IBAction func sliderMoved(_ slider : UISlider){
        currentValue = Int(slider.value.rounded())
    }
    
    
    @IBAction func startNewGame() {
        score = 0
        round = 0
        startNewRound()
    }
    
    
    func startNewRound(){
        targetValue = Int.random(in: 1...100)
        currentValue = 50
        slider.value = Float(currentValue)
        round += 1
        updateLabels()
    }
    
    func updateLabels(){
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
    }
}
