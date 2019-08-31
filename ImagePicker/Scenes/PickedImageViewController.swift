//
//  PickedImageViewController.swift
//  ImagePicker
//
//  Created by Damian Ferens on 30/08/2019.
//  Copyright © 2019 com.damianferens. All rights reserved.
//

import UIKit

class PickedImageViewController: UIViewController {

    // MARK: - Outlets

    @IBOutlet weak var imageView: UIImageView!
    
    // MARK: - Properties

    var image: UIImage?
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = image
    }

}
