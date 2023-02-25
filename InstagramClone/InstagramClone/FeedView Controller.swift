//
//  FeedView Controller.swift
//  InstagramClone
//
//  Created by Elif Bilge Parlak on 23.02.2023.
//

import UIKit
import Firebase
import SDWebImage

class FeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var userEmailArray = [String]()
    var userCommentArray = [String]()
    var likeArray = [Int]()
    var userImageArray = [String]()
    var documentIdArrary = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        getDataFromFirestore()
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! FeedCell
        cell.userEmailLabel.text = userEmailArray[indexPath.row]
        cell.likeLabel.text = String(likeArray[indexPath.row])
        cell.userImageView.sd_setImage(with: URL(string: userImageArray[indexPath.row]))
        cell.commentLabel.text = userCommentArray[indexPath.row]
        cell.docIdLabel.text = documentIdArrary[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userEmailArray.count
    }
    
    func getDataFromFirestore(){
        let firestoreDatabase = Firestore.firestore()
        firestoreDatabase.collection("posts").order(by: "date",descending: true)
            .addSnapshotListener { (snapshot, error) in
            if error != nil {
               
            }else{
                if snapshot?.isEmpty != true && snapshot != nil{
                    self.userImageArray.removeAll(keepingCapacity: false)
                    self.userEmailArray.removeAll(keepingCapacity: false)
                    self.userCommentArray.removeAll(keepingCapacity: false)
                    self.likeArray.removeAll(keepingCapacity: false)
                    self.documentIdArrary.removeAll(keepingCapacity: false)
                    for doc in snapshot!.documents{
                       let docId = doc.documentID
                        self.documentIdArrary.append(docId)
                        if let postedBy = doc.get("postedBy") as?  String{
                            self.userEmailArray.append(postedBy)
                        }
                        if let postComment = doc.get("postComment") as? String{
                            self.userCommentArray.append(postComment)
                        }
                        if let likes = doc.get("likes") as? Int{
                            self.likeArray.append(likes)
                        }
                        if let imageURL = doc.get("imageURL") as? String{
                            self.userImageArray.append(imageURL)
                        }
                    }
                    
                    self.tableView.reloadData()
                }
               
            }
            
        }
    }


}
