//
//  PhotosArray.swift
//  Navigation
//
//  Created by Sergey Omelchenko on 05.07.2022.
//

import UIKit

var photosArray: [UIImage] = []
func addPhotosArray() {
    photosArray = (0...20).compactMap { UIImage(named: "1\($0)")}
}

