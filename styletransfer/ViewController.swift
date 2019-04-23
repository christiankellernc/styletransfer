//
//  ViewController.swift
//  styletransfer
//
//  Created by Christian Keller on 4/17/19.
//  Copyright © 2019 Christian Keller. All rights reserved.
//

import UIKit
import Photos
import MobileCoreServices
import Fritz
import FritzVisionStyleModelPaintings

class ViewController: UIViewController, AVCaptureVideoDataOutputSampleBufferDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    var previewView: UIImageView!
    private var inputImage = UIImage(named: "style_image")!
    lazy var styleModel = FritzVisionStyleModel(model: CustomStyleModel())
    

    override func viewDidLoad() {
        super.viewDidLoad()
        ImageView.image = UIImage(named: "style_image")
    }
    

    @IBOutlet var ImageView: UIImageView!
    
    @IBAction func transform(_ sender: UIButton) {
        let fritzImage = FritzVisionImage(image: inputImage)
        styleModel.predict(fritzImage) { stylizedImage, error in
            guard let stylizedImage = stylizedImage, error == nil else {
                print("Error encountered running Style Model")
                return
            }
            let styled = UIImage(pixelBuffer: stylizedImage)
            DispatchQueue.main.async {
                self.ImageView.image = styled
            }
        }
    }
    
    @IBAction func saveResult(_ sender: UIBarButtonItem) {
        guard let image = ImageView.image else {
            return
        }
        PHPhotoLibrary.shared().performChanges({
            PHAssetChangeRequest.creationRequestForAsset(from: image)
        }, completionHandler: nil)
    }
    
    @IBAction func takePhoto(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let cameraAction = UIAlertAction(title: "Camera", style: .default) { (action) in
            self.showImagePicker(camera: true)
        }
        alert.addAction(cameraAction)
        
        let libraryAction = UIAlertAction(title: "Photo Library", style: .default) { (action) in
            self.showImagePicker(camera: false)
        }
        alert.addAction(libraryAction)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
        }
        alert.addAction(cancelAction)
        
        if UIDevice.current.userInterfaceIdiom == .pad {
            alert.popoverPresentationController?.sourceView = self.view
        }
        
        present(alert, animated: true, completion: nil)
    }
    
    private func showImagePicker(camera: Bool) {
        let imagePicker = UIImagePickerController()
        if camera {
            imagePicker.sourceType = .camera
            imagePicker.showsCameraControls = true
        } else {
            imagePicker.sourceType = .photoLibrary
        }
        
        imagePicker.delegate = self
        
        imagePicker.mediaTypes = [kUTTypeImage as String]
        imagePicker.allowsEditing = true
        
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        // Local variable inserted by Swift 4.2 migrator.
        let info = convertFromUIImagePickerControllerInfoKeyDictionary(info)
        
        if let image = info[convertFromUIImagePickerControllerInfoKey(UIImagePickerController.InfoKey.editedImage)] as? UIImage {
            inputImage = image
            ImageView.image = image
        }
        
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    
   
    
    // Helper function inserted by Swift 4.2 migrator.
    fileprivate func convertFromUIImagePickerControllerInfoKeyDictionary(_ input: [UIImagePickerController.InfoKey: Any]) -> [String: Any] {
        return Dictionary(uniqueKeysWithValues: input.map {key, value in (key.rawValue, value)})
    }
    
    // Helper function inserted by Swift 4.2 migrator.
    fileprivate func convertFromUIImagePickerControllerInfoKey(_ input: UIImagePickerController.InfoKey) -> String {
        return input.rawValue
    }

}
