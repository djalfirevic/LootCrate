//
//  PostsViewViewModel.swift
//  Boxes
//
//  Created by Djuro Alfirevic on 12/5/18.
//  Copyright © 2018 Djuro Alfirevic. All rights reserved.
//

import Foundation

class PostsViewViewModel {
    
    // MARK: - Properties
    private var posts = [Post]()
    private var users = [User]()
    var count: Int {
        return posts.count
    }
    
    // MARK: - Public API
    subscript(index: Int) -> Post {
        return posts[index]
    }
    
    func fetchPosts(completion: @escaping () -> Void) {
        RESTManager.shared.makeRequest(from: "/api/users?page=1", httpBody: nil) { [weak self] (_ response: UsersResponse?, _ error: Error?) in
            if let response = response {
                Logger.log(message: "Users fetched: \(response.data.count)", type: .success)
                
                self?.users = response.data
                self?.setDummyData()
                completion()
            }
        }
    }
    
    // MARK: - Private API
    private func setDummyData() {
        var post1 = Post(title: "First Blog post", datePosted: Date.date(from: "2018-11-10"), imageURL: "http://www.trbimg.com/img-59d7a2aa/turbine/ct-mitch-trubisky-nfl-bears-savior-lincicome-spt-1008-20171007")
        post1.comments = [Comment(), Comment(), Comment()]
        post1.author = users.first
        
        var post2 = Post(title: "Second Blog post", datePosted: Date.date(from: "2018-12-12"), imageURL: "https://images-na.ssl-images-amazon.com/images/I/81CgBQsNY9L._SY679_.jpg")
        post2.comments = [Comment(), Comment()]
        post2.author = users.last
        
        var post3 = Post(title: "Third Blog post about something specific", datePosted: Date.date(from: "2018-10-03"), imageURL: "https://static01.nyt.com/images/2018/09/24/sports/24nfllive-1/merlin_144193302_42c58add-8e64-44bd-8d3c-275621ded1cd-articleLarge.jpg?quality=75&auto=webp&disable=upscale")
        post3.comments = [Comment(), Comment(), Comment(), Comment()]
        post3.author = users.last
        
        posts = [post1, post2, post3]
    }
    
}
