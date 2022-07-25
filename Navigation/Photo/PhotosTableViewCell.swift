//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by Sergey Omelchenko on 05.07.2022.
//

import UIKit

class PhotosTableViewCell: UITableViewCell {

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        addContent()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addContent () {
        contentView.addSubview(photosLabel)
        contentView.addSubview(PhotosTableViewCell.arrowButton)
        contentView.addSubview(previewStackView)
        previewStackView.addSubview(previewImage1)
        previewStackView.addSubview(previewImage2)
        previewStackView.addSubview(previewImage3)
        previewStackView.addSubview(previewImage4)
    }
    
    
    private lazy var photosLabel: UILabel = {
        let photosLabel = UILabel()
        photosLabel.text = "Photos"
        photosLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        photosLabel.textColor = .black
        photosLabel.translatesAutoresizingMaskIntoConstraints = false
        return photosLabel
    }()
    
    private lazy var previewImage1: UIImageView = {
        let previewImage1 = UIImageView()
        previewImage1.image = photosArray[1]
        previewImage1.translatesAutoresizingMaskIntoConstraints = false
        previewImage1.layer.cornerRadius = 6
        previewImage1.clipsToBounds = true
        return previewImage1
    }()
    
    private lazy var previewImage2: UIImageView = {
        let previewImage2 = UIImageView()
        previewImage2.image = photosArray[2]
        previewImage2.translatesAutoresizingMaskIntoConstraints = false
        previewImage2.layer.cornerRadius = 6
        previewImage2.clipsToBounds = true
        return previewImage2
    }()
    
    private lazy var previewImage3: UIImageView = {
        let previewImage3 = UIImageView()
        previewImage3.image = photosArray[3]
        previewImage3.translatesAutoresizingMaskIntoConstraints = false
        previewImage3.layer.cornerRadius = 6
        previewImage3.clipsToBounds = true
        return previewImage3
    }()
    
    private lazy var previewImage4: UIImageView = {
        let previewImage4 = UIImageView()
        previewImage4.image = photosArray[4]
        previewImage4.translatesAutoresizingMaskIntoConstraints = false
        previewImage4.layer.cornerRadius = 6
        previewImage4.clipsToBounds = true
        return previewImage4
    }()
    
    private lazy var previewStackView: UIStackView = {
        let previewStackView = UIStackView()
        previewStackView.translatesAutoresizingMaskIntoConstraints = false
        previewStackView.axis = .horizontal
        previewStackView.distribution = .fillEqually
        previewStackView.alignment = .center
        previewStackView.spacing = 8
        return previewStackView
    }()
    
    static var arrowButton: UIButton = {
        let arrowButton = UIButton()
        arrowButton.setImage(UIImage(systemName: "arrow.right", withConfiguration: UIImage.SymbolConfiguration(pointSize: 40))?.withTintColor(.black, renderingMode: .alwaysOriginal), for: .normal)
        arrowButton.setImage(UIImage(systemName: "arrow.right", withConfiguration: UIImage.SymbolConfiguration(pointSize: 20))?.withTintColor(.gray, renderingMode: .alwaysOriginal), for: .highlighted)
        arrowButton.translatesAutoresizingMaskIntoConstraints = false
            return arrowButton
    }()
    
    private func setupLayout() {
            NSLayoutConstraint.activate([
                
                photosLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12 ),
                photosLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12 ),
                
                PhotosTableViewCell.arrowButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
                PhotosTableViewCell.arrowButton.centerYAnchor.constraint(equalTo: photosLabel.centerYAnchor),
                PhotosTableViewCell.arrowButton.heightAnchor.constraint(equalToConstant: 40),
                PhotosTableViewCell.arrowButton.widthAnchor.constraint(equalToConstant: 40),
                
                previewStackView.topAnchor.constraint(equalTo: photosLabel.bottomAnchor, constant: 12),
                previewStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12 ),
                previewStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
                previewStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
                
                previewImage1.widthAnchor.constraint(greaterThanOrEqualToConstant: (contentView.frame.width - 16) / 4),
                previewImage1.heightAnchor.constraint(equalTo: previewImage1.widthAnchor),
                
                previewImage2.widthAnchor.constraint(greaterThanOrEqualToConstant: (contentView.frame.width - 16) / 4),
                previewImage2.heightAnchor.constraint(equalTo: previewImage2.widthAnchor),
                
                previewImage3.widthAnchor.constraint(greaterThanOrEqualToConstant: (contentView.frame.width - 16) / 4),
                previewImage3.heightAnchor.constraint(equalTo: previewImage2.widthAnchor),
                
                previewImage4.widthAnchor.constraint(greaterThanOrEqualToConstant: (contentView.frame.width - 16) / 4),
                previewImage4.heightAnchor.constraint(equalTo: previewImage2.widthAnchor),
                
            ])
        }
}
