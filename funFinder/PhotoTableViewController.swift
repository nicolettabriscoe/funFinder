//
//  PhotoTableViewController.swift
//  funFinder
//
//  Created by Apple on 7/16/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class PhotoTableViewController: UITableViewController {
    
    var photos : [Photos] = []

    override func viewDidLoad() {
        super.viewDidLoad()}
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photos.count}
    
    func getPhotos() {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext{
            
            if let coreDataPhotos = try?
                context.fetch(Photos.fetchRequest()) as? [Photos] {
                
                photos = coreDataPhotos
                tableView.reloadData()}
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getPhotos()}
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell ()
        
        let cellPhoto = photos[indexPath.row]
        
        cell.textLabel?.text = "I hope this works!"
        
        if let cellPhotoImageData =
    cellPhoto.imageData {
        if let cellPhotoImage = UIImage(data: cellPhotoImageData) {
                cell.imageView?.image = cellPhotoImage}
            }
   return cell
}

}
