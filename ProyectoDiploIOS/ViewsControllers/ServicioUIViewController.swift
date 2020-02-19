//
//  ServicioUIViewController.swift
//  ProyectoDiploIOS
//
//  Created by Bruno Torres on 16/02/20.
//  Copyright © 2020 Bruno Torres. All rights reserved.
//

import UIKit

class ServicioUIViewController: UIViewController {

    @IBOutlet weak var serviceImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var comments: UIButton!
    @IBOutlet weak var rating: UILabel!
    @IBOutlet weak var descriptionTextView : UITextView!
    
    private var service: Service?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

//    init(service: Service) {
//        super.init()
//        self.service = service
//        self.titleLabel.text = service.title
//
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
