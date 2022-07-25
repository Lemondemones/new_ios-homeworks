//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by Sergey Omelchenko on 06.04.2022.
//

import Foundation
import UIKit
import iOSIntPackage

class PostTableViewCell: UITableViewCell {
    
    var postAuthor: UILabel = {
        var postAuthor = UILabel()
        postAuthor.translatesAutoresizingMaskIntoConstraints = false
        postAuthor.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        postAuthor.textColor = .black
        postAuthor.numberOfLines = 2
        return postAuthor
    }()
    
    var postDescription: UILabel = {
        var postDescription = UILabel()
        postDescription.translatesAutoresizingMaskIntoConstraints = false
        postDescription.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        postDescription.textColor = .systemGray
        postDescription.numberOfLines = 0
        return postDescription
    }()
    
    var postLike: UILabel = {
        var postLike = UILabel()
        postLike.translatesAutoresizingMaskIntoConstraints = false
        postLike.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        postLike.textColor = .black
        return postLike
    }()
    
    var postViews: UILabel = {
        var postViews = UILabel()
        postViews.translatesAutoresizingMaskIntoConstraints = false
        postViews.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        postViews.textColor = .black
        return postViews
    }()
    
    var postImage: UIImageView = {
        var postImage = UIImageView()
        postImage.translatesAutoresizingMaskIntoConstraints = false
        postImage.backgroundColor = .black
        postImage.contentMode = .scaleAspectFit
        return postImage
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addContent()
        setupLayout()
        self.selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addContent() {
        contentView.addSubview(postAuthor)
        contentView.addSubview(postDescription)
        contentView.addSubview(postLike)
        contentView.addSubview(postViews)
        contentView.addSubview(postImage)
    }
    func configuratePostTableViewCell(title: String, like: Int, views: Int, description: String, image: String) {
        
        self.postImage.image = UIImage(named: image)
        self.postLike.text = "Likes: \(like)"
        self.postViews.text = "Views: \(views)"
        self.postDescription.text = description
        self.postAuthor.text = title
        
        let random = Int.random(in: 1...4)
        let filter: ColorFilter?

        switch random {
        case 1: filter = .tonal
        case 2: filter = .fade
        case 3: filter = .chrome
        case 4: filter = .noir
        default:
                filter = nil
        }

        let iProcessor = ImageProcessor()
        guard let filter = filter else { return }
        guard let image = postImage.image else { return }

        iProcessor.processImage(sourceImage: image, filter: filter) { filterImage in
            postImage.image = filterImage
        }
    }
    
    func setupLayout() {
        NSLayoutConstraint.activate([
            
            contentView.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            postAuthor.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            postAuthor.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            postAuthor.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            postImage.topAnchor.constraint(equalTo: postAuthor.bottomAnchor, constant: 16),
            postImage.heightAnchor.constraint(equalTo: postImage.widthAnchor),
            postImage.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            
            postDescription.topAnchor.constraint(equalTo: postImage.bottomAnchor, constant: 16),
            postDescription.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            postDescription.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            
            postLike.topAnchor.constraint(equalTo: postDescription.bottomAnchor, constant: 16),
            postLike.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            postLike.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            
            postViews.topAnchor.constraint(equalTo: postDescription.bottomAnchor, constant: 16),
            postViews.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            postViews.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            
        ])
    }
}
