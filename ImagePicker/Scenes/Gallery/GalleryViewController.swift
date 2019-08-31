//
//	GalleryViewController.swift
//	ImagePicker
//
//	Created by Damian Ferens on 30/08/2019.
//	Copyright (c) 2019 com.damianferens. All rights reserved.
//

import UIKit

protocol GalleryDisplayLogic: class {
    func displayImagePicker(viewModel: Gallery.ImagePicker.ViewModel)
    func displayImagePickerClosed()
    func displayPickedImage()
}

class GalleryViewController: UIViewController, GalleryDisplayLogic {

	// MARK: - Properties

	var interactor: GalleryBusinessLogic?
	var router: (NSObjectProtocol & GalleryRoutingLogic & GalleryDataPassing)?

	// MARK: - Initialization
	
	override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
		super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
		setup()
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		setup()
	}
	
	// MARK: - Setup
	
	private func setup() {
		let viewController = self
		let interactor = GalleryInteractor()
		let presenter = GalleryPresenter()
		let router = GalleryRouter()
		viewController.interactor = interactor
		viewController.router = router
		interactor.presenter = presenter
		presenter.viewController = viewController
		router.viewController = viewController
		router.dataStore = interactor
	}
	
	// MARK: - Routing
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if let scene = segue.identifier {
			let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
			if let router = router, router.responds(to: selector) {
				router.perform(selector, with: segue)
			}
		}
	}
	
	// MARK: - Lifecycle
	
	override func viewDidLoad() {
		super.viewDidLoad()
	}
    
    // MARK: - Actions
    
    @IBAction func pickImageAction(_ sender: UIButton) {
        interactor?.pickImage()
    }

	// MARK: - Display Logic
    
    func displayImagePicker(viewModel: Gallery.ImagePicker.ViewModel) {
        present(viewModel.picker, animated: true, completion: nil)
    }
    
    func displayImagePickerClosed() {
        dismiss(animated: true, completion: nil)
    }
    
    func displayPickedImage() {
        router?.routeToPickedImageViewer()
    }
}
