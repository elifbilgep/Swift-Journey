//
//  SettingsViewController.swift
//  BasicSnapchatClone
//
//  Created by Elif Bilge Parlak on 8.03.2023.
//

import UIKit
import Firebase

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func logOutClicked(_ sender: Any) {
        do{
            try Auth.auth().signOut()
            self.performSegue(withIdentifier: "toSignInViewController", sender: nil)
        }catch{
            
        }
    }
    
}
