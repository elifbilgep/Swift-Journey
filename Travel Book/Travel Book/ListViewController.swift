//
//  ListViewController.swift
//  Travel Book
//
//  Created by Elif Bilge Parlak on 18.02.2023.
//

import UIKit
import CoreData

class ListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{

    @IBOutlet weak var tableView: UITableView!
    var nameArray = [String]()
    var idArray = [UUID]()
    var choosenName = ""
    var choosenId : UUID?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.add, target: self, action: #selector(addButtonClicked))
        
        getData()
       
    }
    
    
    
    @objc func addButtonClicked(){
        choosenName = ""
        
        performSegue(withIdentifier: "toListViewController", sender: nil)
    }
    
   @objc func getData(){
        let appDelegate = UIApplication.shared.delegate  as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Places")
        request.returnsObjectsAsFaults = false
        do{
            let results = try context.fetch(request)
            if results.count > 0{
                self.nameArray.removeAll(keepingCapacity: false)
                self.idArray.removeAll(keepingCapacity: false)
                for result in results as! [NSManagedObject]{
                    if let name = result.value(forKey: "name") as? String{
                        self.nameArray.append(name)
                    }
                    if let id = result.value(forKey: "id") as? UUID{
                        self.idArray.append(id)
                        
                    }
                    tableView.reloadData()
                }
            }
        }catch{ print("error")
            
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = nameArray[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        choosenName = nameArray[indexPath.row]
        choosenId = idArray[indexPath.row]
        performSegue(withIdentifier: "toListViewController", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toListViewController"{
            let destinationVC = segue.destination as! ViewController
            destinationVC.selectedId = choosenId
            destinationVC.selectedName = choosenName
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        NotificationCenter.default.addObserver(self, selector: #selector(getData), name: NSNotification.Name("newPlace"), object: nil)
    }
    

}
