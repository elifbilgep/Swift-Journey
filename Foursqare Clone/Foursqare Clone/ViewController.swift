//
//  ViewController.swift
//  Foursqare Clone
//
//  Created by Elif Bilge Parlak on 26.02.2023.
//

import UIKit
import Parse

class ViewController: UIViewController {

    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var userNameTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
       
    }

    @IBAction func signUpClicked(_ sender: Any) {
        if userNameTextField.text != "" && passwordTextField.text != ""{
            let user = PFUser()
            user.username = userNameTextField.text!
            user.password = passwordTextField.text!
            
            user.signUpInBackground { success, error in
                if error != nil{
                    self.makeAlert(title: "Error", message: error?.localizedDescription ?? "Error")
                }else{
                    //Segue
                    self.performSegue(withIdentifier: "toPlacesVC", sender: nil)
                }
            }
        }else{
            makeAlert(title: "Error", message: "Invalid inputs")
        }
    }
    
    @IBAction func signInClicked(_ sender: Any) {
        if userNameTextField.text == "" && passwordTextField.text == ""{
            makeAlert(title: "Error", message: "Invalid input")
        }else{
            PFUser.logInWithUsername(inBackground: userNameTextField.text!, password: passwordTextField.text!) { user, error in
                if error != nil{
                    self.makeAlert(title: "Error", message: error?.localizedDescription ?? "Error")
                }else{
                    //Segue
                    self.performSegue(withIdentifier: "toPlacesVC", sender: nil)
                }
            }
        }
        
    }
    
    func makeAlert(title:String, message: String){
        let alert = UIAlertController(title:title, message: message, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel)
        alert.addAction(okButton)
        self.present(alert,animated: true)
    }
}

