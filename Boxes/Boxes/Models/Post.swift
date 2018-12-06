//
//  Post.swift
//  Boxes
//
//  Created by Djuro Alfirevic on 12/5/18.
//  Copyright © 2018 Djuro Alfirevic. All rights reserved.
//

import Foundation

struct Post: Codable {
    
    // MARK: - Properties
    var title: String
    var datePosted: String
    var imageURL: String
    var comments: [Comment]?
    var author: User?
    
    private enum CodingKeys: String, CodingKey {
        case title
        case datePosted
        case imageURL
        case comments
    }
    
}
