//
//  ServiceTableViewCell.swift
//  ProyectoDiploIOS
//
//  Created by Ricardo Hernández González on 24/02/20.
//  Copyright © 2020 Bruno Torres. All rights reserved.
//

import UIKit

class ServiceTableViewCell: UITableViewCell {

    
    @IBOutlet weak var picture: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
