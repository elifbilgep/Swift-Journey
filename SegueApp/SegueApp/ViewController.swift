//
//  ViewController.swift
//  SegueApp
//
//  Created by Elif Bilge Parlak on 22.01.2023.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var myLabel: UILabel!
    
    var userName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func nextClicked(_ sender: Any) {
        userName = nameTextField.text!
        performSegue(withIdentifier: "toSecondVC", sender: nil)
    }
     
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSecondVC"{
         let destinationVC =   segue.destination as! SecondViewController
            
            destinationVC.myName = userName
        }
    }
}

