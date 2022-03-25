//
//  Posting.swift
//  Database
//
//  Created by 이원석 on 2021/08/18.
//

import Foundation
import Firebase

struct Review {
    
    var rating: Int // Can also be enum
    var userID: String
    var username: String
    var title: String
    var text: String
    var date: Date

    var dictionary: [String: Any] {
        return [
            "rating": rating,
            "userId": userID,
            "userName": username,
            "title" : title,
            "text": text,
            "timestamp": Timestamp(date: date)
        ]
  }
}
