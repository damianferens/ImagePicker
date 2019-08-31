//
//	GalleryInteractor.swift
//	ImagePicker
//
//	Created by Damian Ferens on 30/08/2019.
//	Copyright (c) 2019 com.damianferens. All rights reserved.
//

import UIKit

protocol GalleryBusinessLogic {
    func pickImage()
}

protocol GalleryDataStore {
    var pickedImage: UIImage? { get set }
}

class GalleryInteractor: NSObject, GalleryBusinessLogic, GalleryDataStore {

	// MARK: - Properties

	var presenter: GalleryPresentationLogic?
	private let worker = GalleryWorker()
    var pickedImage: UIImage?
    private lazy var imagePicker: UIImagePickerController = {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = false
        picker.sourceType = .photoLibrary
        picker.mediaTypes = ["public.image"]
        picker.modalPresentationStyle = .popover
        return picker
    }()
	
	// MARK: - Business Logic
    
    func pickImage() {
        let response = Gallery.ImagePicker.Response(picker: imagePicker)
        presenter?.presentImagePicker(response: response)
    }
	
}

// MARK: - UIImagePickerControllerDelegate & UINavigationControllerDelegate

extension GalleryInteractor: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        presenter?.presentImagePickerClosed()
    }
    
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        if let pickedImage = info[.originalImage] as? UIImage {
            self.pickedImage = pickedImage.greyed()
            presenter?.presentPickedImage()
            presenter?.presentImagePickerClosed()
        }
    }
}
