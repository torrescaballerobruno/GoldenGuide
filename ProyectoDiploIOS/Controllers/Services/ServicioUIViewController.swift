//
//  ServicioUIViewController.swift
//  ProyectoDiploIOS
//
//  Created by Bruno Torres on 16/02/20.
//  Copyright © 2020 Bruno Torres. All rights reserved.
//

import UIKit

class ServicioUIViewController: UICollectionViewCell {
    
    static let identifier: String = "serviceCell"
    public var service: Service? {
        didSet {
            updateView()
        }
    }
    
    @IBOutlet weak var serviceImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var comments: UIButton!
    @IBOutlet weak var rating: UILabel!
    @IBOutlet weak var descriptionTextView : UITextView!
    
    func reset() {
        self.serviceImage.image = nil
        self.titleLabel.text = ""
        self.rating.text = ""
        self.descriptionTextView.text = ""
    }

    func updateView() {
        reset()
        guard let service = self.service else { return }
        self.titleLabel.text = service.title
        self.rating.text = service.hirings.description
        self.descriptionTextView.text = service.description
        
        /*self.likeCounter.text = post.likesCountText()
        post.load { [unowned self] img in
            self.imageView.image = img
        }*/
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
