//
//  User.swift
//  Keep-IT-Real
//
//  Created by Jesse Hough on 10/09/23.
//

import Foundation
import ParseSwift

struct User: ParseUser {
   
    var objectId: String?
    var createdAt: Date?
    var updatedAt: Date?
    var ACL: ParseACL?
    var originalData: Data?
    var username: String?
    var email: String?
    var emailVerified: Bool?
    var password: String?
    var authData: [String: [String: String]?]?
}
