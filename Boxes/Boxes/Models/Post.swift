//
//  Post.swift
//  Boxes
//
//  Created by Djuro Alfirevic on 12/5/18.
//  Copyright © 2018 Djuro Alfirevic. All rights reserved.
//

import Foundation

struct Post {
    
    // MARK: - Properties
    var title: String
    var datePosted: Date
    var imageURL: String
    var comments: [Comment]?
    var author: User?
    
    // MARK: - Designated Initializer
    init(title: String, datePosted: Date, imageURL: String) {
        self.title = title
        self.datePosted = datePosted
        self.imageURL = imageURL
    }
    
}
