//
//  ViewController.swift
//  Catch Kenny
//
//  Created by Elif Bilge Parlak on 12.02.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var kenny1: UIImageView!
    @IBOutlet weak var kenny2: UIImageView!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var kenny5: UIImageView!
    @IBOutlet weak var kenny4: UIImageView!
    @IBOutlet weak var kenny3: UIImageView!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var kenny6: UIImageView!
    
    @IBOutlet weak var highestScoreLabel: UILabel!
    
    
    
    var timer = Timer()
    var counter = 10
    var highestScore = 0
    var currentScore = 0
    var selectedKennyNum = 0
        
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timerLabel.text = "Time: \(counter)"
        timer = Timer.scheduledTimer(timeInterval: 0.6, target: self, selector: #selector(timeFunction), userInfo: nil, repeats: true)
        hideKennys()
    }
    
    @objc func timeFunction( ){
        counter -= 1
        let kennys = [kenny1,kenny2,kenny3,kenny4,kenny5,kenny6]
        timerLabel.text = "Time: \(counter)"
        hideKennys()
        selectedKennyNum = Int.random(in: 1...6)
        
        for i in 0...5{
            kennys[i]!.isUserInteractionEnabled = true;
            let gestureRecogniser = UITapGestureRecognizer(target: self, action: #selector(addToScore))
            kennys[i]!.addGestureRecognizer(gestureRecogniser)
            if(selectedKennyNum-1 == i){
                kennys[i]!.isHidden = false
            }
        }

        if counter == 0{
            timer.invalidate()
            timerLabel.text = "Your time is up"
            alertBox()
            
        }
    }
    
    @objc func addToScore(){
        currentScore += 1
        scoreLabel.text = "Score: \(currentScore)"
        
        if highestScore < currentScore{
            highestScore = currentScore
            highestScoreLabel.text = "High score: \(highestScore)"
        }
    }
    
    func hideKennys(){
        let kennys = [kenny1,kenny2,kenny3,kenny4,kenny5,kenny6]
        for i in 0...5{
                kennys[i]!.isHidden = true
        }
        
        kenny1.isHidden = true
        kenny2.isHidden = true
        kenny3.isHidden = true
        kenny4.isHidden = true
        kenny5.isHidden = true
        kenny6.isHidden = true
    }
    
    func enableUserInteractionsOnKennys(){
        kenny1.isUserInteractionEnabled = true;
        
    }
    
    func alertBox(){
        let alert = UIAlertController(title: "Try Again", message: "Time is up", preferredStyle: UIAlertController.Style.alert)
        let cancelButton = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel)
        let tryAgainButton = UIAlertAction(title: "Try Again", style: UIAlertAction.Style.default)
        
        alert.addAction(cancelButton)
        alert.addAction(tryAgainButton)
        self.present(alert, animated: true)
    }
    


}

