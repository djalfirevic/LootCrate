//
//  User.swift
//  Boxes
//
//  Created by Djuro Alfirevic on 12/5/18.
//  Copyright © 2018 Djuro Alfirevic. All rights reserved.
//

import Foundation

struct User: Codable {
    
    // MARK: - Properties
    var id: Int
    var firstName: String
    var lastName: String
    var avatar: String
    var fullName: String {
        return "\(firstName) \(lastName)"
    }
    
    private enum CodingKeys: String, CodingKey {
        case id
        case firstName = "first_name"
        case lastName = "last_name"
        case avatar
    }
    
}
