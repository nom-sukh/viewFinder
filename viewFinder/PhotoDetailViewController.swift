//
//  PhotoDetailViewController.swift
//  viewFinder
//
//  Created by Apple on 6/25/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController {

    override func viewDidLoad()
    {
        super.viewDidLoad()
        if let realPhoto = photo
        {
            title = realPhoto.caption
            if let cellPhotoImageData = realPhoto.imageData
            {
                if let cellPhotoImage = UIImage(data: cellPhotoImageData)
                {
                    newImageView.image = cellPhotoImage
                }
            }
        }
    }
    @IBOutlet weak var newImageView: UIImageView!
    var photo : Photos? = nil
}
