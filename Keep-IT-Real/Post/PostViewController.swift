//
//  PostViewController.swift
//  Keep-IT-Real
//
//  Created by Jesse Hough on 10/09/23.
//

import UIKit
import PhotosUI
import ParseSwift

class PostViewController: UIViewController {

    @IBOutlet weak var shareButton: UIBarButtonItem!
    @IBOutlet weak var captionTextField: UITextField!
    @IBOutlet weak var previewImageView: UIImageView!
    

    private var pickedImage: UIImage?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let placeholderText = "Enter your photo caption here"
        let placeholderAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.darkGray]
            
        captionTextField.attributedPlaceholder = NSAttributedString(string: placeholderText, attributes: placeholderAttributes)
    }

    @IBAction func onPickedImageTapped(_ sender: UIBarButtonItem) {
        
        var config = PHPickerConfiguration()
        config.filter = .images
        config.preferredAssetRepresentationMode = .current
        config.selectionLimit = 1
        let picker = PHPickerViewController(configuration: config)
        picker.delegate = self
        present(picker, animated: true)
    }

    @IBAction func onShareTapped(_ sender: Any) {

        view.endEditing(true)
        guard let image = pickedImage,
              let imageData = image.jpegData(compressionQuality: 0.1) else {
            return
        }

        let imageFile = ParseFile(name: "image.jpg", data: imageData)
        var post = Post()
        post.imageFile = imageFile
        post.caption = captionTextField.text
        post.user = User.current
        post.save { [weak self] result in


            DispatchQueue.main.async {
                switch result {
                case .success(let post):
                    print("Post \(post) was successfully saved.")

                case .failure(let error):
                    self?.showAlert(description: error.localizedDescription)
                }
            }
        }
    }

    @IBAction func onViewTapped(_ sender: Any) {
        view.endEditing(true)
    }
}

extension PostViewController: PHPickerViewControllerDelegate {

    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {

        picker.dismiss(animated: true)

        guard let provider = results.first?.itemProvider,
        
        provider.canLoadObject(ofClass: UIImage.self) else { return }
        provider.loadObject(ofClass: UIImage.self) { [weak self] object, error in
            guard let image = object as? UIImage else {
                self?.showAlert()
                return
            }

            if let error = error {
                self?.showAlert(description: error.localizedDescription)
                return
            } else {

                DispatchQueue.main.async {

                    self?.previewImageView.image = image
                    self?.pickedImage = image
                }
            }
        }
    }
}
