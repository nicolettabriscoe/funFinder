//
//  AddPhotoViewController.swift
//  funFinder
//
//  Created by Apple on 7/16/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class AddPhotoViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    
    @IBOutlet weak var captionText: UITextField!
    
    
    @IBOutlet weak var imageView: UIImageView!
    
    
    var imagePicker = UIImagePickerController()
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let selectedImage =
            info[UIImagePickerController.InfoKey.originalImage]as? UIImage {
            imageView.image = selectedImage
        }
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
    }
    

    @IBAction func cameraTapped(_ sender: UIButton) {
        imagePicker.sourceType = .camera
        present (imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func photoLibraryTapped(_ sender: UIButton) {
        imagePicker.sourceType = .photoLibrary
        present( imagePicker, animated: true, completion: nil)
        }
    
    @IBAction func albumsTapped(_ sender: UIButton) {
        imagePicker.sourceType = .savedPhotosAlbum
        present(imagePicker, animated: true, completion: nil)
    }
    
}
