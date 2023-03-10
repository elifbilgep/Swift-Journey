//
//  ViewController.swift
//  BasicSnapchatClone
//
//  Created by Elif Bilge Parlak on 8.03.2023.
//

import UIKit
import Firebase

class SignInViewController: UIViewController {
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func signUpClicked(_ sender: Any) {
        if userNameTextField.text != "" && passwordTextField.text != "" && userNameTextField.text != "" {
            Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!) { auth, error in
                if error != nil{
                    self.makeAlert(title: "Error", message: error?.localizedDescription ?? "Error")
                }else{
                    let firestore = Firestore.firestore()
                    
                    let userDict = ["email" : self.emailTextField.text!, "userName" : self.userNameTextField.text!] as! [String : Any]
                    
                    firestore.collection("UserInfo").addDocument(data: userDict) { error in
                        if error != nil{
                            self.makeAlert(title: "Error", message: error?.localizedDescription ?? "Error")
                        }
                    }
                    
                    self.performSegue(withIdentifier: "toFeedViewController", sender: nil)
                }
            }
            
        }else{
            self.makeAlert(title: "Error", message: "Invalid input")
        }
    }
    
    
    
    @IBAction func signInClicked(_ sender: Any) {
        if passwordTextField.text! != "" && emailTextField.text! != ""{
            Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!) { auth, error in
                if error != nil{
                    self.makeAlert(title: "Error", message: error?.localizedDescription ?? "Error")
                    
                }else{
                    self.performSegue(withIdentifier: "toFeedViewController", sender: nil)
                }
            }
        }else{
            makeAlert(title: "Error", message: "Invalid input")
        }
    }
    
    func makeAlert(title:String, message:String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel)
        alert.addAction(okButton)
        self.present(alert, animated: true)
    }
    
    
}

