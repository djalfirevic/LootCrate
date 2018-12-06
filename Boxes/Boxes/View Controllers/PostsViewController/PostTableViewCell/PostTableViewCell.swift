//
//  PostTableViewCell.swift
//  Boxes
//
//  Created by Djuro Alfirevic on 12/5/18.
//  Copyright © 2018 Djuro Alfirevic. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    // MARK: - Properties
    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var authorImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var commentsLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    var viewModel: PostCellViewModel!
    var post: Post! {
        didSet {
            viewModel = PostCellViewModel(post: post)
            setup()
        }
    }
    
    // MARK: - Private API
    private func setup() {
        postImageView.loadImage(from: viewModel.postImageURL)
        titleLabel.text = viewModel.title
        dateLabel.text = viewModel.date
        authorImageView.loadImage(from: viewModel.authorImageURL)
        authorLabel.text = viewModel.authorName
        commentsLabel.text = viewModel.comments
    }

}
