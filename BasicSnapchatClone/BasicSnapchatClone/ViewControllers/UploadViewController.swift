//
//  UploadViewController.swift
//  BasicSnapchatClone
//
//  Created by Elif Bilge Parlak on 8.03.2023.
//

import UIKit
import Firebase

class UploadViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var uploadImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        uploadImageView.isUserInteractionEnabled = true
        let gestureRecogniser = UITapGestureRecognizer(target: self, action: #selector(choosePicture))
        uploadImageView.addGestureRecognizer(gestureRecogniser)
    }
    

    @objc func choosePicture (){
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        self.present(picker, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        uploadImageView.image = info[.originalImage] as? UIImage
        self.dismiss(animated: true)
    }
    
    @IBAction func uploadClicked(_ sender: Any) {
        
        //STORAGE
        
        let storage = Storage.storage()
        let storageRegerence = storage.reference()
        let mediaFolder = storageRegerence.child("media")
        
        if let data = uploadImageView.image?.jpegData(compressionQuality: 0.5){
            let uuid = UUID().uuidString
            let imageRef = mediaFolder.child("\(uuid).jpeg")
            imageRef.putData(data) { metaData, error in
                if error != nil{
                    self.makeAlert(title: "Error", message: error?.localizedDescription ?? "Error")
                }else{
                    imageRef.downloadURL { url, error in
                        if error == nil{
                            let imageUrl = url?.absoluteString
                            
                            //FIRESTORE
                            //bizim userın kaydettiği bir snap  var mı varsa yeni ekle
                            let firestore = Firestore.firestore()
                            firestore.collection("Snaps").whereField("snapOwner", isEqualTo: UserSingleton.sharedUserInfo.userName).getDocuments { snapshot, error in
                                if error != nil {
                                    self.makeAlert(title: "Error", message: error?.localizedDescription ?? "Error occured")
                                }else{
                                    if snapshot?.isEmpty == false && snapshot != nil{
                                        //Eğer zaten data varsa bunu yap
                                        for doc in snapshot!.documents{
                                            let documentId = doc.documentID
                                            if var imageUrlArray = doc.get("imageUrlArray") as? [String]{
                                                imageUrlArray.append(imageUrl!)
                                                
                                                let additionalDictionary = ["imageUrlArray" : imageUrlArray] as [String : Any]
                                                
                                                firestore.collection("Snaps").document(documentId).setData(additionalDictionary, merge: true) { error in
                                                    if error == nil{
                                                        self.tabBarController?.selectedIndex = 0
                                                        self.uploadImageView.image = UIImage(named: "click")
                                                    }
                                                }
                                            }
                                                
                                        }
                                    }else{
                                        //Eğer data hiç yoksa bunu
                                        let snapDirectory = ["imageUrlArray" : [imageUrl!] , "snapOwner": UserSingleton.sharedUserInfo.userName,"date": FieldValue.serverTimestamp()] as [String : Any]
                                        firestore.collection("Snaps").addDocument(data: snapDirectory) { error in
                                            if error != nil{
                                                self.makeAlert(title: "Error", message: error?.localizedDescription ?? "Error bitch!")
                                            }else{
                                                self.tabBarController?.selectedIndex = 0
                                                self.uploadImageView.image = UIImage(named: "click")
                                            }
                                        }
                                    }
                                }
                            }
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
}
