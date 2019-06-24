//
//  AddPhotoViewController.swift
//  viewFinder
//
//  Created by Apple on 6/24/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class AddPhotoViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate
{
    var imagePicker = UIImagePickerController()

    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad()
    {
        super.viewDidLoad()
        imagePicker.delegate = self
    }

    @IBAction func takePictureTapped(_ sender: Any)
    {
        imagePicker.sourceType = .camera
        present(imagePicker, animated:true, completion:nil)
    }
    @IBAction func albumsTapped(_ sender: Any)
    {
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion:nil)
    }
    @IBAction func accessPhotosTapped(_ sender: Any)
    {
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion:nil)
    }
    internal func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any])
    {
        if let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        {
            imageView.image = selectedImage
            imagePicker.dismiss(animated: true, completion: nil)
        }
    }
}
