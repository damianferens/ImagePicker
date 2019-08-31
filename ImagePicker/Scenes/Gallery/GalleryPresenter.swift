//
//	GalleryPresenter.swift
//	ImagePicker
//
//	Created by Damian Ferens on 30/08/2019.
//	Copyright (c) 2019 com.damianferens. All rights reserved.
//

import UIKit

protocol GalleryPresentationLogic {
    func presentImagePicker(response: Gallery.ImagePicker.Response)
    func presentImagePickerClosed()
    func presentPickedImage()
}

class GalleryPresenter: GalleryPresentationLogic {

	// MARK: - Properties

	weak var viewController: GalleryDisplayLogic?
	
	// MARK: - Presentation Logic
    
    func presentImagePicker(response: Gallery.ImagePicker.Response) {
        let viewModel = Gallery.ImagePicker.ViewModel(picker: response.picker)
        viewController?.displayImagePicker(viewModel: viewModel)
    }
    
    func presentImagePickerClosed() {
        viewController?.displayImagePickerClosed()
    }
    
    func presentPickedImage() {
        viewController?.displayPickedImage()
    }


}
