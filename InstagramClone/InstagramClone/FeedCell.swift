//
//  FeedCell.swift
//  InstagramClone
//
//  Created by Elif Bilge Parlak on 24.02.2023.
//

import UIKit
import Firebase

class FeedCell: UITableViewCell {

    
    @IBOutlet weak var docIdLabel: UILabel!
    @IBOutlet weak var likeLabel: UILabel!
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var commentLabel: UILabel!
    @IBOutlet weak var userEmailLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func likButtonClicked(_ sender: Any) {
        let firestoreDatabase = Firestore.firestore()
            
        if let likeCount = Int(likeLabel.text!){
            let likeStore = ["likes" : likeCount+1] as [String : Any]
            firestoreDatabase.collection("posts").document(docIdLabel.text!).setData(likeStore, merge: true)
        }
        
            
    }
}
