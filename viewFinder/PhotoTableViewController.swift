//
//  PhotoTableViewController.swift
//  viewFinder
//
//  Created by Apple on 6/24/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class PhotoTableViewController: UITableViewController
{
    var photos : [Photos] = []

    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        performSegue(withIdentifier: "moveToDetail", sender: photos[indexPath.row])
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "moveToDetail"
        {
            if let newImageView = segue.destination as? PhotoDetailViewController
            {
                
                if let photoToSend = sender as? Photos
                {
                    newImageView.photo = photoToSend
                }
                
            }
        }
    }
    func getPhotos()
    {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
        {
            if let coreDataPhotos = try? context.fetch(Photos.fetchRequest()) as? [Photos]
            {
                    photos = coreDataPhotos
                    tableView.reloadData()
            }
        }
    }
    override func viewWillAppear(_ animated: Bool)
    {
        getPhotos()
    }
    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        // #warning Incomplete implementation, return the number of rows
        return photos.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = UITableViewCell()
        
        let cellPhoto = photos[indexPath.row]
        
        cell.textLabel?.text = cellPhoto.caption
        
        if let cellPhotoImageData = cellPhoto.imageData
        {
            if let cellPhotoImage = UIImage(data: cellPhotoImageData)
            {
                cell.imageView?.image = cellPhotoImage
            }
        }
        return cell
    }
}
