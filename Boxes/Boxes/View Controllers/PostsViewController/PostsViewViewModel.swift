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
    private var activePage = 1
    
    private let pages = [
        1: "https://gist.githubusercontent.com/mbutan/e3a89e8b189ed279658bb62065c55e68/raw/7d16a275f805a35fe635a3415ed2406b50ac7912/gistfile1.txt",
        2: "https://gist.githubusercontent.com/mbutan/cbddc7b86494614e7d3b08b1af29dbd0/raw/37b9c0cd15a00c0e4cf71665fed5107e13b2b872/gistfile1.txt",
        3: "https://gist.githubusercontent.com/mbutan/54d25b2faa8f63161339372d75707738/raw/4224d71cd6c4068a940091270a9edfb9bb498de2/gistfile1.txt"
    ]
    
    // MARK: - Public API
    subscript(index: Int) -> Post {
        return posts[index]
    }
    
    func fetchPosts(completion: @escaping () -> Void) {
        guard let url = pages[activePage] else {
            completion()
            return
        }
        
        RESTManager.shared.makeRequest(from: url, httpBody: nil) { [weak self] (_ response: PostsResponse?, _ error: Error?) in
            if let response = response {
                self?.posts.append(contentsOf: response.data)
                self?.activePage += 1
                completion()
            }
        }
    }
    
    func shouldFetchNewPosts() -> Bool {
        return activePage <= pages.count
    }
    
    // MARK: - Private API
    private func fetchUsers(completion: @escaping () -> Void) {
        RESTManager.shared.makeRequest(from: "\(USERS_BASE_PATH)/api/users?page=1", httpBody: nil) { [weak self] (_ response: UsersResponse?, _ error: Error?) in
            if let response = response {
                Logger.log(message: "Users fetched: \(response.data.count)", type: .success)
                
                self?.users = response.data
                completion()
            }
        }
    }
    
}
