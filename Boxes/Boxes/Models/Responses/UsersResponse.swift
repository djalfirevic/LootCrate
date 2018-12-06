//
//  UsersResponse.swift
//  Boxes
//
//  Created by Djuro Alfirevic on 12/5/18.
//  Copyright © 2018 Djuro Alfirevic. All rights reserved.
//

import Foundation

struct UsersResponse: Codable {
    
    // MARK: - Properties
    var page: Int
    var perPage: Int
    var total: Int
    var totalPages: Int
    var data: [User]
    
    private enum CodingKeys: String, CodingKey {
        case page
        case perPage = "per_page"
        case total
        case totalPages = "total_pages"
        case data
    }
    
}
