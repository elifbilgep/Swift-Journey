//
//  ViewController.swift
//  Alert Project
//
//  Created by Elif Bilge Parlak on 11.02.2023.
//

import UIKit

class ViewController: UIViewController {

   
    @IBOutlet weak var password2Text: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var userNameText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func signUpClicked(_ sender: Any) {
        /*
        let alert = UIAlertController(title: "Error!", message: "User name not found", preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) {
            UIAlertAction in
            //button clicked
            print("button clicked")
        }
        alert.addAction(okButton)
        self.present(alert, animated: true,completion: nil)
        */
        if userNameText.text == "" {
            alertBox(message: "User name can not be empty",title: "Error")
        
        }else if passwordText.text == ""{
           alertBox(message: "Password can not be empty",title:  "Error")
            
        }
        else if passwordText.text != password2Text.text{
            alertBox(message: "Passwords dont match" , title: "Error")
            
        }else{
            alertBox(message: "User signed up succesfully", title: "Ok")
        }
    }
    
    func alertBox(message:String, title:String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default,handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true,completion: nil)
        
    }



}

