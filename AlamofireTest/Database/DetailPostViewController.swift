//
//  DetailPostViewController.swift
//  Database
//
//  Created by 이원석 on 2021/08/27.
//

import UIKit

class DetailPostViewController: UIViewController {

    @IBOutlet weak var postContent: UILabel!
    var myword: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        postContent.text = myword

        // Do any additional setup after loading the view.
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
