//
//  UIImageExtension.swift
//  ImagePicker
//
//  Created by Damian Ferens on 30/08/2019.
//  Copyright © 2019 com.damianferens. All rights reserved.
//

import UIKit

extension UIImage {
    
    func greyed() -> UIImage? {
        guard let currentCGImage = self.cgImage else { return nil }
        let currentCIImage = CIImage(cgImage: currentCGImage)
        let filter = CIFilter(name: "CIColorMonochrome")
        filter?.setValue(currentCIImage, forKey: "inputImage")
        filter?.setValue(CIColor(red: 0.5, green: 0.5, blue: 0.5), forKey: "inputColor")
        filter?.setValue(1.0, forKey: "inputIntensity")
        guard let outputImage = filter?.outputImage,
            let cgimg = CIContext().createCGImage(outputImage, from: outputImage.extent)
            else { return nil }
        let processedImage = UIImage(cgImage: cgimg)
        return processedImage
    }
}
