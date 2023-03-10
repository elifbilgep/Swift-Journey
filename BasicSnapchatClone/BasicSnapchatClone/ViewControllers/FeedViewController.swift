//
//  FeedViewController.swift
//  BasicSnapchatClone
//
//  Created by Elif Bilge Parlak on 8.03.2023.
//

import UIKit
import Firebase
import SDWebImage

class FeedViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    
    @IBOutlet weak var feedTableView: UITableView!
    let firestoreDatabase = Firestore.firestore()
    var snapArray = [Snap]()
    var chosenSnap : Snap?
    var timeLeft : Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        feedTableView.delegate = self
        feedTableView.dataSource = self
        
        getSnapsFromFirebase()
        
        getUserInfo()
        
    }
    
    func getUserInfo(){
        firestoreDatabase.collection("UserInfo").whereField("email", isEqualTo: Auth.auth().currentUser!.email).getDocuments { snapshot, error in
            if error != nil{
                self.makeAlert(title: "Error", message: error?.localizedDescription ?? "Error occured.")
            }else{
                if snapshot?.isEmpty == false && snapshot != nil{
                    for doc in snapshot!.documents{
                        if let userName = doc.get("userName") as? String{
                            UserSingleton.sharedUserInfo.email = Auth.auth().currentUser!.email!
                            UserSingleton.sharedUserInfo.userName = userName
                           
                        }
                    }
                }
            }
        }
    }
    
    func makeAlert(title:String,message:String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.destructive)
        alert.addAction(okButton)
        self.present(alert, animated: true)
    }
    

    func getSnapsFromFirebase(){
        firestoreDatabase.collection("Snaps").order(by: "date",descending: true).addSnapshotListener { snapshot, error in
            if error != nil{
                self.makeAlert(title: "Error", message: error?.localizedDescription ?? "Error")
            }else{
                if snapshot != nil && snapshot?.isEmpty == false {
                    self.snapArray.removeAll(keepingCapacity: false)
                    for doc in snapshot!.documents{
                        let docId = doc.documentID
                        if let username = doc.get("snapOwner" ) as? String {
                            if let imageUrlArray = doc.get("imageUrlArray") as? [String]{
                                if let date = doc.get("date") as? Timestamp{
                                    
                                    if let difference = Calendar.current.dateComponents([.hour], from: date.dateValue(), to: Date()).hour{
                                        if difference >= 24{
                                            //Delete
                                            self.firestoreDatabase.collection("Snaps").document(docId).delete()
                                        }
                                        self.timeLeft = 24 - difference
                                    }
                                    
                                    print(username)
                                    
                                    let snap = Snap(username: username, imageUrlArray: imageUrlArray, date: date.dateValue())
                                    self.snapArray.append(snap)
                                }
                            }
                        }
                        self.feedTableView.reloadData()
                    }
                }
            }
            
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return snapArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell",for: indexPath) as! FeedCell
        cell.feedUseNameLabel.text = snapArray[indexPath.row].username
        cell.feedImageView.sd_setImage(with: URL(string: snapArray[indexPath.row].imageUrlArray[0]))
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSnapVC"{
            let destinationVC = segue.destination as! SnapViewController
            destinationVC.selectedSnap = chosenSnap
            destinationVC.selectedTime = self.timeLeft
            
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenSnap = self.snapArray[indexPath.row]
        performSegue(withIdentifier: "toSnapVC", sender: nil)
    }
}
