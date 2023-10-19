//
//  PostCell.swift
//  Keep-IT-Real
//
//  Created by Jesse Hough on 10/09/23.
//

import UIKit
import Alamofire
import AlamofireImage

class PostCell: UITableViewCell {

    @IBOutlet private weak var usernameLabel: UILabel!
    @IBOutlet private weak var postImageView: UIImageView!
    @IBOutlet private weak var captionLabel: UILabel!
    @IBOutlet private weak var dateLabel: UILabel!
    @IBOutlet private weak var blurView: UIVisualEffectView!

    private var imageDataRequest: DataRequest?

    func configure(with post: Post) {

        if let user = post.user {
            usernameLabel.text = user.username
        }

        if let imageFile = post.imageFile,
           let imageUrl = imageFile.url {
            imageDataRequest = AF.request(imageUrl).responseImage { [weak self] response in
                switch response.result {
                case .success(let image):
                    self?.postImageView.image = image
                case .failure(let error):
                    print("Image error: \(error.localizedDescription)")
                    break
                }
            }
        }

        captionLabel.text = post.caption

        if let date = post.createdAt {
            dateLabel.text = DateFormatter.postFormatter.string(from: date)
        }
    }

    override func prepareForReuse() {
        
        super.prepareForReuse()
        postImageView.image = nil
        imageDataRequest?.cancel()
    }
}
