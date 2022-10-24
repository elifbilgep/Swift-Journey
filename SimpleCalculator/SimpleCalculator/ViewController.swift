//
//  ViewController.swift
//  SimpleCalculator
//
//  Created by Elif Bilge Parlak on 24.10.2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var firstText: UITextField!
    @IBOutlet weak var secondText: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func sumClicked(_ sender: Any) {
        //ilk ünlem uı text field ın değer gelip gelmemesine eminim demek
        //ikinci ünlem integer a kesin dönüşebilir demek
        
        if let firstNumber = Int(firstText.text!){
            if  let secondNumber = Int(secondText.text!){
                let result = firstNumber + secondNumber
                resultLabel.text = String(result)
            }
        }
     
    }
    
    @IBAction func minusClicked(_ sender: Any) {
        if let firstNumber = Int(firstText.text!){
            if  let secondNumber = Int(secondText.text!){
                let result = firstNumber - secondNumber
                resultLabel.text = String(result)
            }
        }
    }
    @IBAction func multiplyClicked(_ sender: Any) {
        if let firstNumber = Int(firstText.text!){
            if  let secondNumber = Int(secondText.text!){
                let result = firstNumber * secondNumber
                resultLabel.text = String(result)
            }
        }
    }
    @IBAction func divideClicked(_ sender: Any) {
        if let firstNumber = Int(firstText.text!){
            if  let secondNumber = Int(secondText.text!){
                let result = firstNumber / secondNumber
                resultLabel.text = String(result)
            }
        }
    }
}

