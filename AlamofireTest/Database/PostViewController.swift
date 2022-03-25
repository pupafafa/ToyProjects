//
//  PostViewController.swift
//  Database
//
//  Created by 이원석 on 2021/08/18.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore



class PostViewController: UIViewController {
    
    var savePostings : Array<[String:Any]?> = []
    @IBOutlet weak var titleTextfield: UITextField!
    @IBOutlet weak var reviewTextfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func submitButtonPressed(_ sender: Any) {
        let collection = Firestore.firestore().collection("Posting")
        
        let review = Review(rating: 5,
                            userID: Auth.auth().currentUser!.uid,
                            username: Auth.auth().currentUser?.displayName ?? "Anonymous",
                            title: titleTextfield.text!,
                            text: reviewTextfield.text!, date: Date())
        collection.addDocument(data: review.dictionary)
    }
    
    
    @IBAction func readButtonPressed(_ sender: Any) {
        // Should probably first set the activity indicator to `.startAnimating()`
        let docRef = db.collection("Posting")
        docRef.order(by: "timestamp")
        
        docRef.getDocuments() { [weak self] document, error in
        // Should probably set the activity indicator to `.stopAnimating()`
        if let err = error{
            print("error getting documents") //probably a good place to display an alert
            return
        }else{
            let documents = document!.documents
            let postingsData = documents.map { $0.data() }
            print(postingsData)
            self?.performSegue(withIdentifier: "toTable", sender: postingsData)
        }
             
        }
          
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        let navVC = segue.destination as? UINavigationController
        if let tableVC = navVC?.topViewController as? PostingListTableViewController, let postingsData = sender as? [[String:Any]] {
            tableVC.updatedPostings = postingsData
        
        /*
        if let postingListTableViewController = segue.destination as? PostingListTableViewController,
           let postingsData = sender as? [[String:Any]] {
            postingListTableViewController.updatedPostings = postingsData
             */
        }
    }
     
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
