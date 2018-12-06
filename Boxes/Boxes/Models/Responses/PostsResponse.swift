//
//  PostsResponse.swift
//  Boxes
//
//  Created by Djuro Alfirevic on 12/6/18.
//  Copyright © 2018 Djuro Alfirevic. All rights reserved.
//

import Foundation

struct PostsResponse: Codable {
    
    // MARK: - Properties
    var page: Int
    var perPage: Int
    var total: Int
    var totalPages: Int
    var data: [Post]
    
    private enum CodingKeys: String, CodingKey {
        case page
        case perPage = "per_page"
        case total
        case totalPages = "total_pages"
        case data
    }
    
}
