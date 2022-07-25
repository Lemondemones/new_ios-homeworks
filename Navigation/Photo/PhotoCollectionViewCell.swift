//
//  PhotoCollectionViewCell.swift
//  Navigation
//
//  Created by Sergey Omelchenko on 05.07.2022.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(photo)
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var photo: UIImageView = {
        let photo = UIImageView()
        photo.translatesAutoresizingMaskIntoConstraints = false
        return photo
    }()
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    func setupLayout() {
        NSLayoutConstraint.activate([
            photo.topAnchor.constraint(equalTo: self.topAnchor),
            photo.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            photo.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            photo.trailingAnchor.constraint(equalTo: self.trailingAnchor),
        ])
    }
}

extension PhotoCollectionViewCell {
    func configurateCell(image: UIImage) {
        photo.image = image
    }
}
