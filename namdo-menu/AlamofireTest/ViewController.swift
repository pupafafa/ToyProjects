//
//  ViewController.swift
//  AlamofireTest
//
//  Created by 이원석 on 2021/09/05.
//

import UIKit
import Alamofire
import SwiftSoup

class ViewController: UIViewController {

    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var breakfastLabel: UILabel!
    @IBOutlet weak var lunchLabel: UILabel!
    @IBOutlet weak var dinnerLabel: UILabel!
    
    @IBOutlet weak var yesterdayButton: UIButton!
    @IBOutlet weak var nextDayButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        

         /*




        AF.request("https://httpbin.org/headers", parameters: parameters, headers: headers).responseJSON { response in
                    debugPrint(response)
                }
        */

        let headers: HTTPHeaders = [
            "Content-Type": "application/x-www-form-urlencoded"
        ]
        let headers2: HTTPHeaders = [
            "Content-Type": "application/json"
        ]
        
        let parameters = [
            "loginType" : "basic",
            "userType" : "S",
            "recruitDiv" : "regular",
            "name" : "",
            "bdate" : "",
            "mobile" : "",
            "userId" : "pupafafa",
            "password" : "pslws5210@"
        ]

        let redirector = Redirector(behavior: .doNotFollow)
        
        AF.request("http://portal.ndhs.or.kr/login", method: .post, parameters: parameters ).redirect(using: redirector).response{ response in
            debugPrint(response.debugDescription)
            
            guard let myURL = URL(string: "http://portal.ndhs.or.kr/studentLifeSupport/carte/list") else{
                print("url 가져오기 실패")
                return
                
            }
            do {
                let html = try String(contentsOf: myURL, encoding: .utf8)
                let doc: Document = try SwiftSoup.parse(html)
                //print(doc)
                let headerTitle = try doc.title()
                print(headerTitle)
                
                var tableFoodContent = [String]()
                var tmpTableDayContent = [String]()
                var tableDayContent = [String]()
                

                for row in try! doc.select("table") {



                    for col1 in try! row.select("td") {
                        let colContent1 = try! col1.text()
                        tableFoodContent.append(colContent1)
                    }
                    for col2 in try! row.select("th") {
                        let colContent2 = try! col2.text()
                        tmpTableDayContent.append(colContent2)
                    }
                    
                    tableDayContent = Array(tmpTableDayContent[4...])
                    
                    print("food : \(tableFoodContent)")
                    print("food count : \(tableFoodContent.count)")
                    print("day : \(tableDayContent)")
                    print("day count : \(tableDayContent.count)")
                }
                
                self.breakfastLabel.text! = tableFoodContent[0]
                self.lunchLabel.text! = tableFoodContent[1]
                self.dinnerLabel.text! = tableFoodContent[2]
                self.dateLabel.text! = tableDayContent[0]

                
                
                let body = try doc.body()
                let menu = try body?.getElementsByClass("table-responsive").text()
              //  print(menu)
             //   let arr = menu?.components(separatedBy: ",")
               // print(arr)
                } catch Exception.Error(let type, let message) {
                    print("Message: \(message)")
                } catch {
                    print("error")
                }
                 
            

            }
        }
       
    }



//body > div.container-fluid > div:nth-child(6) > div
