//
//  PostCellViewModel.swift
//  Boxes
//
//  Created by Djuro Alfirevic on 12/5/18.
//  Copyright © 2018 Djuro Alfirevic. All rights reserved.
//

import Foundation

struct PostCellViewModel {
    
    // MARK: - Properties
    var post: Post
    var postImageURL: String {
        return post.imageURL
    }
    var title: String {
        return post.title
    }
    var date: String {
        return post.datePosted.string
    }
    var authorImageURL: String {
        if let author = post.author {
            return author.avatar
        }
        
        return ""
    }
    var authorName: String {
        if let author = post.author {
            return author.fullName
        }
        
        return ""
    }
    var comments: String {
        if let comments = post.comments {
            return "\(comments.count)"
        }
        
        return "0"
    }
    
    // MARK: - Designated Initializer
    init(post: Post) {
        self.post = post
    }
    
}
