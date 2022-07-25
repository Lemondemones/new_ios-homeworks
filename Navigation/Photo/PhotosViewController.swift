//
//  PhotosViewControlle.swift
//  Navigation
//
//  Created by Sergey Omelchenko on 05.07.2022.
//

import UIKit
import iOSIntPackage

class PhotosViewController: UIViewController {
    
    var allPhoto: [UIImage] = []
    let facade = ImagePublisherFacade()
    var photoCollectionVC = PhotoCollectionViewCell()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = false
        photosCollection.dataSource = self
        photosCollection.delegate = self
        view.addSubview(photosCollection)
        self.title = "Photo Gallery"
    }
    
    deinit {
        facade.rechargeImageLibrary()
    }
    
    lazy var photosCollection: UICollectionView = {
        let photosLayout = UICollectionViewFlowLayout()
        photosLayout.scrollDirection = .vertical
        let photosCollection = UICollectionView(frame: .zero, collectionViewLayout: photosLayout)
        photosCollection.backgroundColor = .white
        photosCollection.register(PhotoCollectionViewCell.self, forCellWithReuseIdentifier: "PhotoCollectionViewCell")
        return photosCollection
    }()
}

extension PhotosViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return allPhoto.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = photosCollection.dequeueReusableCell(withReuseIdentifier: "PhotoCollectionViewCell", for: indexPath) as! PhotoCollectionViewCell
        cell.configurateCell(image: allPhoto[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let itemsPerRow: CGFloat = 3
            let paddindWidth = 8 * (itemsPerRow + 1)
            let accessibleWidth = collectionView.frame.width - paddindWidth
            let widthPerItem = accessibleWidth / itemsPerRow
            return CGSize(width: widthPerItem, height: widthPerItem)
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            8
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
            8
        }
        
         func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
             return UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
         }
}


extension PhotosViewController: ImageLibrarySubscriber {
    
    func receive(images: [UIImage]) {
        allPhoto = []
        for newPhoto in images {
            allPhoto.append(newPhoto)
        }
        photosCollection.reloadData()
    }
    
    func setupLayout() {
        NSLayoutConstraint.activate([
            photosCollection.topAnchor.constraint(equalTo: self.view.topAnchor),
            photosCollection.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            photosCollection.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            photosCollection.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
        ])
    }
}
