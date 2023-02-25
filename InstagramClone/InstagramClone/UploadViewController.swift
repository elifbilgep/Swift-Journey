//
//  UploadViewController.swift
//  InstagramClone
//
//  Created by Elif Bilge Parlak on 23.02.2023.
//

import UIKit
import Firebase

class UploadViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {

    @IBOutlet weak var detailsTextField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        imageView.isUserInteractionEnabled = true
        let imageGestureRecogniser = UITapGestureRecognizer(target:  self, action: #selector(selectImage))
        imageView.addGestureRecognizer(imageGestureRecogniser)
    }
    
    @objc func selectImage(){
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        present(picker, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imageView.image = info[.originalImage] as? UIImage
        self.dismiss(animated: true)
    }


    @IBAction func onUploadClicked(_ sender: Any) {
        let storage = Storage.storage()
        let storageReference = storage.reference()
        
        let mediaFolder = storageReference.child("media")
        
        if let data = imageView.image?.jpegData(compressionQuality: 0.5){
            let uuid = UUID().uuidString
            let imageReference = mediaFolder.child("\(uuid).jpg")
            imageReference.putData(data, completion: { (metaData, error) in
                if error != nil{
                    self.makeAlert(title: "Error", message: error?.localizedDescription ?? "Error")
                }else{
                    imageReference.downloadURL { url, error in
                        if error == nil{
                            let imageUrl = url?.absoluteURL.absoluteString
                            
                            //DATABASE
                            let firestoreDatabase = Firestore.firestore()
                            var firestoreReference : DocumentReference? = nil
                            let firestorePost = ["imageURL" : imageUrl!, "postedBy" : Auth.auth().currentUser?.email,"postComment" : self.detailsTextField.text!, "date" : FieldValue.serverTimestamp(), "likes" : 0]
                            
                            firestoreReference = firestoreDatabase.collection("posts").addDocument(data: firestorePost,completion: { (error) in
                                if error != nil  {
                                    self.makeAlert(title: "Error", message: error?.localizedDescription ?? "error")
                                }else{
                                    self.imageView.image = UIImage(named: "pick")
                                    self.detailsTextField.text = ""
                                    self.tabBarController?.selectedIndex = 0
                                }
                            })
                            
                        }
                    }
                }
            })
        }
    }
    
    func makeAlert(title : String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel)
        alert.addAction(okButton)
        self.present(alert, animated: true)
    }
}
