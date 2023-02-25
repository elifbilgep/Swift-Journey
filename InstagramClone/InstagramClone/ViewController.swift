//
//  ViewController.swift
//  InstagramClone
//
//  Created by Elif Bilge Parlak on 22.02.2023.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    @IBOutlet weak var passwordTextfield: UITextField!
    @IBOutlet weak var emailTextfield: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
       
    }

    @IBAction func signInClicked(_ sender: Any) {
        if emailTextfield.text != "" && passwordTextfield.text != "" {
            Auth.auth().signIn(withEmail: emailTextfield.text!, password: passwordTextfield.text!) { authData, error in
                if error != nil {
                    self.makeAlert(title: "Error from Firebase", message: error?.localizedDescription ?? "Error")
                }else{
                    self.performSegue(withIdentifier: "toFeedVC", sender: nil)
                }
            }
            
        }else{
            makeAlert(title: "Error", message: "Username or password invalid")
        }
    }
    
    @IBAction func signUpClicked(_ sender: Any) {
        if emailTextfield.text !=  "" && passwordTextfield.text != ""{
            Auth.auth().createUser(withEmail: emailTextfield.text!, password: passwordTextfield.text!) { authData, error in
                if error != nil {
                    self.makeAlert(title: "Error from Firebase", message: error?.localizedDescription ?? "Error")
                }else{
                    self.performSegue(withIdentifier: "toFeedVC", sender: nil)
                }
            }
        }else{
           makeAlert(title: "Error", message: "Username or password invalid")
        }
        
    }
    
    func makeAlert(title : String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel)
        alert.addAction(okButton)
        self.present(alert, animated: true)
    }
}

