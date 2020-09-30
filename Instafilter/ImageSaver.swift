//
//  ImageSaver.swift
//  Instafilter
//
//  Created by Alex Sapsford on 29/09/2020.
//  Copyright © 2020 Alex Sapsford. All rights reserved.
//

import UIKit

class ImageSaver: NSObject {
    
    var successHandler: (() -> Void)?
    var errorHandler: ((Error) -> Void)?
    
    func writeToPhotoAlbum(image: UIImage) {
        UIImageWriteToSavedPhotosAlbum(image, self, #selector(saveError), nil)
    }
    // checks whether an error was provided and calls one of those 2 closures 
    @objc func saveError(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        if let error = error {
            errorHandler?(error)
        } else {
            successHandler?()
        }
    }
}
