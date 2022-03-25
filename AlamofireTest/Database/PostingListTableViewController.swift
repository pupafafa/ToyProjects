//
//  PostingListTableViewController.swift
//  Database
//
//  Created by 이원석 on 2021/08/24.
//

import UIKit
import FirebaseFirestore


 

class PostingListTableViewController: UITableViewController {

    //private var postings: Array<[String:Any]> = []
    private var documents: [DocumentSnapshot] = []
    var updatedPostings: Array<[String:Any]?> = []
    var testPrint:String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        print("view did load")

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source
    


    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        return updatedPostings.count
    }
//test@test.com
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("line 50")
        let cell = tableView.dequeueReusableCell(withIdentifier: "myTableCell", for: indexPath)
        
        if let title = updatedPostings[indexPath.row]!["title"] as? String{
            cell.textLabel?.text = title
        }else{
            cell.textLabel?.text = "Posting without title"

        }

        // Configure the cell...

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goDetail"{
            if let destination = segue.destination as? DetailPostViewController{
                print("디테일뷰 찾아서 들어왔음")
                print(destination)
                if let selectedIndex = self.tableView.indexPathForSelectedRow?.row{
                    
                    destination.postContent?.text! = updatedPostings[selectedIndex]?["text"] as! String
                    destination.myword = updatedPostings[selectedIndex]?["text"] as! String
                    print("109")
                }else{
                    destination.postContent?.text! = "안되서 이걸로 변경했어"
                    print("112")
                    }

                            
            }
            
        }
        
        }
    

}
