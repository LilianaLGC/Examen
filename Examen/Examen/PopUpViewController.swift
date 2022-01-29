//
//  PopUpViewController.swift
//  Examen
//
//  Created by Lili on 26/01/22.
//

import UIKit

class PopUpViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    let imagePicker : UIImagePickerController = UIImagePickerController()
    @IBOutlet weak var imagen: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.8)
        imagePicker.delegate = self
    }
    
    @IBAction func selfieBtn(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            if (UIImagePickerController.availableCaptureModes(for: .front) != nil){
                imagePicker.allowsEditing = false
                imagePicker.sourceType = .camera
                imagePicker.cameraCaptureMode = .photo
                
                present(imagePicker, animated: true, completion: nil)
            }
        }
    }
    private func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String: AnyObject]) {
        //
    }
    @IBAction func close(_ sender: Any) {
        self.view.removeFromSuperview()
    }
    
}
