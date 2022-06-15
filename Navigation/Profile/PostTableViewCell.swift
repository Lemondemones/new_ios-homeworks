//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by Sergey Omelchenko on 06.04.2022.
//

import Foundation
import UIKit
import iOSIntPackage
import SnapKit

class PostTableViewCell: UITableViewCell {
    
    
    
    var postAuthor: UILabel = {
        var postAuthor = UILabel()
        let iProcessor = ImageProcessor()
        postAuthor.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        postAuthor.textColor = .black
        postAuthor.numberOfLines = 2
        return postAuthor
    }()
    
    var postDescription: UILabel = {
        var postDescription = UILabel()
        postDescription.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        postDescription.textColor = .systemGray
        postDescription.numberOfLines = 0
        return postDescription
    }()
    
    var postLike: UILabel = {
        var postLike = UILabel()
        postLike.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        postLike.textColor = .black
        return postLike
    }()
    
    var postViews: UILabel = {
        var postViews = UILabel()
        postViews.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        postViews.textColor = .black
        return postViews
    }()
    
    var postImage: UIImageView = {
        var postImage = UIImageView()
        postImage.backgroundColor = .black
        postImage.contentMode = .scaleAspectFit
        return postImage
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addContent()
        setupLayout()
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
        
          
        postAuthor.snp.makeConstraints { (make) in
            make.top.equalTo(contentView.snp.top).offset(16)
            make.leading.equalTo(contentView.snp.leading).offset(16)
            make.trailing.equalTo(contentView.snp.trailing).offset(-16)
        }
        
        postImage.snp.makeConstraints { (make) in
            make.top.equalTo(postAuthor.snp.bottom).offset(16)
            make.height.equalTo(postImage.snp.width)
            make.width.equalTo(contentView.snp.width)
        }
        
        postDescription.snp.makeConstraints { (make) in
            make.top.equalTo(postImage.snp.bottom).offset(16)
            make.leading.equalTo(contentView.snp.leading).offset(16)
            make.trailing.equalTo(contentView.snp.trailing).offset(-16)
        }
        
        postLike.snp.makeConstraints { (make) in
            make.top.equalTo(postDescription.snp.bottom).offset(16)
            make.leading.equalTo(contentView.snp.leading).offset(16)
            make.bottom.equalTo(contentView.snp.bottom).offset(-16)
        }
        
        postViews.snp.makeConstraints { (make) in
            make.top.equalTo(postDescription.snp.bottom).offset(16)
            make.trailing.equalTo(contentView.snp.trailing).offset(-16)
            make.bottom.equalTo(contentView.snp.bottom).offset(-16)
        }
    }
    
}
