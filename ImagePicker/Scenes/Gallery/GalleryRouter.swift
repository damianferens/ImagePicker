//
//	GalleryRouter.swift
//	ImagePicker
//
//	Created by Damian Ferens on 30/08/2019.
//	Copyright (c) 2019 com.damianferens. All rights reserved.
//

import UIKit

@objc protocol GalleryRoutingLogic {
    func routeToPickedImageViewer()
}

protocol GalleryDataPassing {
	var dataStore: GalleryDataStore? { get }
}

class GalleryRouter: NSObject, GalleryRoutingLogic, GalleryDataPassing {

	// MARK: - Properties

	weak var viewController: GalleryViewController?
	var dataStore: GalleryDataStore?
	
	// MARK: - Routing
    
    func routeToPickedImageViewer() {
        guard let destinationVC = UIStoryboard(name: "Main", bundle: nil)
            .instantiateViewController(withIdentifier: "ImageViewerViewController") as? PickedImageViewController else { return }
        destinationVC.image = dataStore?.pickedImage
        viewController?.navigationController?.pushViewController(destinationVC, animated: true)
    }
}
