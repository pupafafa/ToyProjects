//
//  ViewController.swift
//  Database
//
//  Created by 이원석 on 2021/08/18.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    
    @IBOutlet weak var newEmailField: UITextField!
    @IBOutlet weak var newPasswordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
   /*     if let user = Auth.auth().currentUser{
            emailField.placeholder = "Already logged in"
            passwordField.placeholder = "Already logged in"
            
        }*/
    }

    @IBAction func loginButtonTapped(_ sender: Any) {
        Auth.auth().signIn(withEmail: emailField.text!, password: passwordField.text!) { (user, error) in

            if user != nil{
                print("login success")
                let vcName = self.storyboard?.instantiateViewController(withIdentifier: "startScreen")
                vcName?.modalPresentationStyle = .fullScreen //전체화면으로 보이게 설정
                vcName?.modalTransitionStyle = .crossDissolve //전환 애니메이션 설정
                self.present(vcName!, animated: true, completion: nil)
                
            }

            else{
                print(error?.localizedDescription)
            }
      }
    }
    
    @IBAction func logoutButtonTapped(_ sender: Any) {
        let firebaseAuth = Auth.auth()
    do {
        
        try firebaseAuth.signOut()
        emailField.placeholder = "Email"
        passwordField.placeholder = "Password"
    }catch let signOutError as NSError {
      print("Error signing out: %@", signOutError)
    }
    }
    
    
    
    @IBAction func confirmButtonTapped(_ sender: Any) {
        Auth.auth().createUser(withEmail: newEmailField.text!, password: newPasswordField.text!

        ) { (user, error) in

            if user !=  nil{

                print("register success")

            }

            else{

                print("register failed")

            }

        }



    }
}

