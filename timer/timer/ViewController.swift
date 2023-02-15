//
//  ViewController.swift
//  timer
//
//  Created by Elif Bilge Parlak on 11.02.2023.
//

import UIKit

class ViewController: UIViewController {
    
    var timer = Timer()
    var counter = 0

    @IBOutlet weak var timeLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        counter = 10
        timeLabel.text = "Time \(counter)"
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timeFunction), userInfo: nil, repeats: true)
    }
    
    @objc func timeFunction(){
        timeLabel.text = "Time \(counter)"
        counter -= 1
        
        if(counter == 0){
            timer.invalidate()
            timeLabel.text = "Timer is over"
        }
    }

    @IBAction func buttonClicked(_ sender: Any) {
        
        print("hello")
    }
    
}

